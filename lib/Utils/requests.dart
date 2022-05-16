import 'dart:convert';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjob/Model/Matches.dart';
import 'package:swapjob/Model/Offer.dart';
import 'package:http/http.dart' as http;

// const String baseUrl = "http://localhost"; //LOCAL
const String baseUrl = "http://api.swapjob.tk/SwapJob"; //PRODUCTION
// const String baseUrl = "http://swapjob.tk:8080/SwapJob"; //SEMI PRODUCTION

final http.Client client = http.Client();

Future<List<MatchUser>> getMatchesUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response = await client
      .get(Uri.parse(baseUrl+'/user/matches'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<MatchUser>((json) => MatchUser.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load matches for user');
  }
}

Future<List<Offer>> getOffers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response = await client
      .get(Uri.parse(baseUrl+'/offer/recommended'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
  } else {
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

Future<bool> removeMatchOffer(int idOffer) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var data = {"offerId": idOffer};
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/removeMatchOffer'));
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
