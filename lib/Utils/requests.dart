import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Offer.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost"; //LOCAL
// const String baseUrl = "http://api.swapjob.tk/SwapJob"; //PRODUCTION

Future<List<Offer>?> getOffers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var headers = {
    'Authorization': 'Bearer $token',
    'Access-Control-Allow-Origin': '*'
  };
  var request = http.Request('GET', Uri.parse(baseUrl + '/offer/all'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
  return [];
}

Future<bool> performLogin(String email, String password) async {
  print(email);
  print(password);
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
    sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
    return true;
  }

  return false;
}
