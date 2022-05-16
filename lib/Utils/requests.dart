import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Offer.dart';
import 'package:http/http.dart' as http;

// const String baseUrl = "http://localhost"; //LOCAL
const String baseUrl = "http://api.swapjob.tk/SwapJob"; //PRODUCTION
// const String baseUrl = "http://swapjob.tk:8080/SwapJob"; //SEMI PRODUCTION

final http.Client client = http.Client();

Future<List<Offer>> getOffers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var headers = {
    'Authorization': 'Bearer $token',
  };

  final response = await client
      .get(Uri.parse(baseUrl+'/offer/recommended'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load offers');
  }
}

Future<bool> matchOffer(int idOffer) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var data = {"offerId": idOffer};
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/matchOffer'));
  request.body = json.encode(data);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  return response.statusCode == 200;
}

Future<bool> performLogin(String email, String password) async {

  var data = {"email": email, "password": password};
  var headers = {
    'Content-Type': 'application/json',
  };

  var request = http.Request('POST', Uri.parse(baseUrl + '/auth/signin'));
  request.body = json.encode(data);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  if (response.statusCode == 200) {
    print(response.body);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    sharedPreferences.setString('accessToken', jsonResponse['accessToken']);
    return true;
  }

  return false;
}
