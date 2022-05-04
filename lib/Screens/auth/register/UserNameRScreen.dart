
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjob/Screens/Home.dart';
import 'package:swapjob/Utils/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserNameRScreen extends StatefulWidget {
  Map<String, dynamic> userData;
  UserNameRScreen(this.userData);

  @override
  _UserNameRScreenState createState() => _UserNameRScreenState();
}

class _UserNameRScreenState extends State<UserNameRScreen> {
  String firstName = '';
  String lastName = '';
  String postalCode = '';
  String phone = '';
  String birthDate = '';
  String description = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: FloatingActionButton(
            elevation: 10,
            child: IconButton(
              color: secondaryDarkBlueColor,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white38,
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
                children: <Widget>[
                  Padding(
                    child: Text(
                      "Create Account",
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
                    controller: firstNameController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "First name",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),

                      helperStyle: TextStyle(
                          color: secondaryDarkBlueColor, fontSize: 15),
                    ),
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: lastNameController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Last name",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: postalCodeController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Postal Code",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        postalCode = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: phoneController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Phone",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),

                  TextFormField(
                    controller: birthDateController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(

                      hintText: "Birthday",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        birthDate = value;
                      });
                    },
                  )
                ]),
              ),
              firstName.isNotEmpty && lastName.isNotEmpty
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
                                        primaryOrangeColor.withOpacity(.5),
                                        primaryOrangeColor.withOpacity(.8),
                                        primaryOrangeColor,
                                        primaryOrangeColor
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
                            /*
                            widget.userData.addAll(
                              {

                                "firstName": firstNameController.text,
                                "lastName": lastNameController.text,
                                "postalCode": int.parse(postalCodeController.text),
                                "phone": phoneController.text,
                                "birthDate": birthDateController.text as DateTime,
                                "description": "string",
                                "companyUser" : true

                            });*/

                            widget.userData.addAll({
                              "email": "asd123312@gmail.com",
                            "password": "123",
                            "firstName": "123",
                            "lastName": "123",
                            "postalCode": 123,
                            "phone": "123",
                            "birthDate": "2022-04-14",
                            "description": "string",
                            "companyUser": true
                            });
                            signup(widget.userData);
                            print(widget.userData);
                            /*Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  RegisterScreen(widget.userData)));*/
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
                              ),
                              height: MediaQuery.of(context).size.height * .065,
                              width: MediaQuery.of(context).size.width * .75,
                              child: Center(
                                  child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: secondaryDarkBlueColor,
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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  signup(Map data) async {

    var headers = {
      'Content-Type': 'application/json'
    };
    //var response = await http.post(Uri.parse("http://api.swapjob.tk/SwapJob/auth/signin"), body: convert.jsonEncode(data));
    var request = http.Request(
        'POST', Uri.parse('http://api.swapjob.tk/SwapJob/auth/signup'));
    request.body = json.encode(data);
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {

      var jsonResponse = convert.jsonDecode(response.body) as Map<String,
          dynamic>;
      setState(() {
        sharedPreferences.setString("accessToken", jsonResponse['accessToken']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage()),
                (Route<dynamic> route) => false);
      });
    }
    else {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
            content: Text("Error, retry again")));
      });
    }
  }
}


