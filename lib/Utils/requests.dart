import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Offer.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost"; //LOCAL
// const String baseUrl = "http://api.swapjob.tk/SwapJob"; //PRODUCTION

// Future<List<Offer>?> getOffers() async {
//   var headers = {
//     'Authorization':
//         'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwYWtvQGFzdGFwb3IuY29tIiwiaWF0IjoxNjUyMDk2NDYyLCJleHAiOjE2NTIxODI4NjJ9.wKbbMfN0asCniRv_jdk0Xxa8Wc6_T6S6c1-nwU8WKDlxqwCJ7AoWS-_FCW0EjsWciDUCz8kyufowOPHPljM9mQ'
//   };
//   var request = http.Request('GET', Uri.parse('http://localhost/offer/all'));
//   request.headers.addAll(headers);
//   var streamedResponse = await request.send();
//   print('Response: ' + await streamedResponse.stream.bytesToString());
//   var response = await http.Response.fromStream(streamedResponse);
//
//   if (response.statusCode != 200) {
//     print('Response status: ${response.statusCode}');
//   }
//
//   print('Response body: ${response.body}');
//
//   return response.body.isEmpty
//       ? []
//       : json
//           .decode(response.body)
//           .map<Offer>((json) => Offer.fromJson(json))
//           .toList();
// }

Future<List<Offer>?> getOffers() async {
  // final response = await http.get(Uri.parse(baseUrl + '/offer/all'),
  // headers: {
  //   HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwYWtvQGFzdGFwb3IuY29tIiwiaWF0IjoxNjUyMDk2NDYyLCJleHAiOjE2NTIxODI4NjJ9.wKbbMfN0asCniRv_jdk0Xxa8Wc6_T6S6c1-nwU8WKDlxqwCJ7AoWS-_FCW0EjsWciDUCz8kyufowOPHPljM9mQ',
  //   HttpHeaders.accessControlAllowOriginHeader: '*',
  //   HttpHeaders.accessControlAllowCredentialsHeader: 'true'
  // });
  //
  // final responseJson = json.decode(response.body);
  // print(responseJson);
  //
  // return responseJson.isEmpty
  //     ? []
  //     : responseJson;
  var headers = {
    'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwYWtvQGFzdGFwb3IuY29tIiwiaWF0IjoxNjUyMTE3MjU5LCJleHAiOjE2NTIyMDM2NTl9.qyd1y6Vqn9cI1KP6vYdkUmrtQL1TW1PJRUw97bQyaf99k3nRdqwpAOM_xjzty_p-aihsIbKnYVcd5kUJ6q5C_A',
    'Access-Control-Allow-Origin': '*'
  };
  var request = http.Request('GET', Uri.parse('http://localhost/offer/all'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }
  return [];
}

Future<bool> performLogin(String email, String password) async {
  print(email);
  print(password);
  var data = {
    "email" : email,
    "password" : password
  };
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
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
    return true;
  }

  return false;
}