import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:swapjobapp/Model/Preference.dart';
import '../Model/Offer.dart';
import '../Model/Skill.dart';
import '../Model/User.dart';
import '../Model/UserMatches.dart';

//const String baseUrl = "http://localhost"; //LOCAL
// const String baseUrl = "http://192.168.1.10"; //LOCAL MOBIL
const String baseUrl = "http://api.swapjob.tk/SwapJob"; //PRODUCTION
// const String baseUrl = "http://swapjob.tk:8080/SwapJob"; //SEMI PRODUCTION

final http.Client client = http.Client();

Future<List<User>> getUserProfile() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response =
      await client.get(Uri.parse(baseUrl + '/user/getProfile'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    final List parsed = json.decode("[" + response.body + "]");
    List<User> list = parsed.map((val) => User.fromJson(val)).toList();

    return list;
  } else {
    throw Exception('Failed to load matches for user');
  }
}

Future<List<UserMatch>> getMatchesUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response =
      await client.get(Uri.parse(baseUrl + '/user/matches'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<UserMatch>((json) => UserMatch.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load matches for user');
  }
}

Future<bool> editProfile(
    String firstName,
    String lastName,
    String email,
    String postalCode,
    String phone,
    String birth,
    String description,
    bool visible,
    int status) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  var data = {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "postalCode": postalCode,
    "phone": phone,
    "birthDate": birth,
    "description": description,
    "status_id": status,
    "visible": visible
  };
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var request = http.Request('POST', Uri.parse(baseUrl + '/user/edit'));

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
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    sharedPreferences.setString('accessToken', jsonResponse['accessToken']);
    return true;
  }

  return false;
}

Future<bool> deleteUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response =
      await client.get(Uri.parse(baseUrl + '/user/delete'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });

  return response.statusCode == 200;
}

Future<List<Offer>> getOffers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response =
      await client.get(Uri.parse(baseUrl + '/offer/recommended'), headers: {
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  });
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
  } else {
    print("Failed to load offers");
  }
  return [];
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

Future<bool> contractedMatchOffer(int idOffer, bool contracted) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var data = {"matchOfferId": idOffer, "contracted" : contracted};
  // ContractedRequest data = ContractedRequest(matchOfferId: idOffer, isContracted: contracted);
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/setContracted'));
  request.body = json.encode(data);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  return response.statusCode == 200;
}

Future<bool> userExists(String email) async {
  var headers = {
    'Content-Type': 'application/json',
  };

  var request = http.Request('POST', Uri.parse(baseUrl + '/auth/checkEmail'));
  request.body = email;
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  return response.body == 'true' ? true : false;
}

Future<bool> createGoogleUser(
    String email, String password, String displayName) async {
  var data = {
    "email": email,
    "password": password,
    "firstName": displayName,
    "lastName": "Missing",
    "postalCode": "08193",
    "phone": "0123456789",
    "birthDate": "2000-01-01",
    "description": "Missing",
    "companyUser": false
  };
  var headers = {
    'Content-Type': 'application/json',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/auth/signup'));
  request.body = json.encode(data);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Skill>> getSkills() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');

  final response =
      await client.get(Uri.parse(baseUrl + '/skill/all'), headers: {
    "Accept": "application/json",
  });
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Skill>((json) => Skill.fromJson(json)).toList();
  } else {
    print("Failed to load skills");
  }

  return [];
}

Future<bool> requestSetSkillsUser(List<int> ids) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/skill/update'));

  request.body = json.encode(ids);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  return response.statusCode == 200;
}

Future<bool> requestSetPreferenceUser(List<Preference> preferences) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/preference/update'));

  request.body = json.encode(preferences);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  return response.statusCode == 200;
}

Future<bool> register(Map data) async {
  var headers = {
    'Content-Type': 'application/json',
  };
  var request = http.Request('POST', Uri.parse(baseUrl + '/auth/signup'));

  request.body = json.encode(data);
  request.headers.addAll(headers);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  return response.statusCode == 200;
}

Future<bool> uploadFile(File selectedfile, bool isCv) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString('accessToken');
  var headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'multipart/form-data'
  };

  var request = http.MultipartRequest(
      'POST', Uri.parse(baseUrl + '/user/upload' + (isCv ? 'cv' : 'title')));

  request.files
      .add(await http.MultipartFile.fromPath('file', selectedfile.path));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return response.statusCode == 200;
}
