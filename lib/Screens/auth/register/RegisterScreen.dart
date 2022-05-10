import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjob/Previous/HomeScreen_Other.dart';
import 'package:swapjob/Screens/auth/register/UserNameRScreen.dart';
//import 'package:swapjob/Screens/UserDOB.dart'; BIRTHDAY SCCREEN
import 'package:swapjob/Utils/color.dart';

import '../LoginScreen.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  Map<String, dynamic> userData = {}; //user personal info
  bool _isLoading = false;
  String email = '';
  String password = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: FloatingActionButton(
            elevation: 10,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: primaryOrangeColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: const <Widget>[
                  Padding(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: 40),
                    ),
                    padding: EdgeInsets.only(left: 50, top: 120),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),

                      helperStyle: TextStyle(
                          color: secondaryDarkBlueColor, fontSize: 15),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Password",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  )
                ]),
              ),
              email.isNotEmpty && password.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  thirdBlueColor.withOpacity(.5),
                                  thirdBlueColor.withOpacity(.8),
                                  thirdBlueColor,
                                  thirdBlueColor
                                ])),
                        height: MediaQuery.of(context).size.height * .065,
                        width: MediaQuery.of(context).size.width * .75,
                        child: Center(
                            child: Text(
                              "CONTINUE",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ))),
                    onTap: () {
                      setState(() {
                        _isLoading = true;
                      });
                      signup(emailController.text, passwordController.text);
                    },
                  ),
                ),
              )
                  : Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            color: primaryOrangeColor
                        ),
                        height: MediaQuery.of(context).size.height * .065,
                        width: MediaQuery.of(context).size.width * .75,

                        child: Center(
                            child: Text(
                              "CONTINUE",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ))),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future signup(String email, String password) async {
    var data = {
      "email" : email,
      "password" : password
    };
    var headers = {
      'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*'

    };
    //var response = await http.post(Uri.parse("http://api.swapjob.tk/SwapJob/auth/signin"), body: convert.jsonEncode(data));
    var request = http.Request('POST', Uri.parse('http://api.swapjob.tk/SwapJob/auth/signin'));
    request.body = json.encode(data);
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("The user already exists")));
    }
    else {
      setState(() {
        _isLoading = false;
        userData.addAll(data);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => UserNameRScreen(userData)),
                (Route<dynamic> route) => false);
      });


    }











  }

}
