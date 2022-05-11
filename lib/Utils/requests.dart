import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Offer.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost"; //LOCAL
//const String baseUrl = "http://api.swapjob.tk/SwapJob"; //PRODUCTION
final http.Client client = http.Client();

Future<List<Offer>> getOffers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var headers = {
    'Authorization': 'Bearer $token',
    "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Credentials": "true",
  "Access-Control-Allow-Headers" : "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods" : "GET, HEAD",
  };
  /*
  var request = http.Request('GET', Uri.parse(baseUrl + '/offer/all'));
  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
  print("parsed");
  print(parsed);
  return (response.statusCode == 200) ?
    parsed.map<Offer>((json) => Offer.fromJson(json)).toList() :
    [];

   */

  final response = await client
      .get(Uri.parse(baseUrl+'/offer/all'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
    "Access-Control_Allow_Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers" : "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods" : "GET, HEAD",
  });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<bool> performLogin(String email, String password) async {

  var data = {"email": email, "password": password};
  var headers = {
    'Content-Type': 'application/json',
    'Access-Control_Allow_Origin': '*',
  "Access-Control-Allow-Credentials": "true",
  "Access-Control-Allow-Headers" : "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods" : "GET, POST, HEAD",
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
