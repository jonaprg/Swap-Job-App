
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjob/Screens/Home.dart';
import 'package:swapjob/Utils/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../Model/Offer.dart';
import '../../../Utils/requests.dart';

class UserNameRScreen extends StatefulWidget {
  Map<String, dynamic> userData;
  UserNameRScreen(this.userData);

  @override
  _UserNameRScreenState createState() => _UserNameRScreenState();
}

class _UserNameRScreenState extends State<UserNameRScreen> {
  DateTime currentDate = DateTime.now();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

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
                        value = firstNameController.text;
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
                        value = lastNameController.text;
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
                        value = postalCodeController.text;
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
                        value = phoneController.text;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(DateFormat('yyyy-MM-dd').format(currentDate)),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select birthday date'),
                      ),
                    ],
                  ),
                ]),
              ),
              firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty
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
                            print(currentDate);
                            print(firstNameController.text);
                            widget.userData.addAll(
                              {

                                "firstName": firstNameController.text,
                                "lastName": lastNameController.text,
                                "postalCode": int.parse(postalCodeController.text),
                                "phone": phoneController.text,
                                "birthDate": DateFormat('yyyy-MM-dd').format(currentDate),
                                "description": "string",
                                "companyUser" : true

                            });
                            /*widget.userData.addAll({
                              "email": "asd123312@gmail.com",
                            "password": "123",
                            "firstName": "123",
                            "lastName": "123",
                            "postalCode": 123,
                            "phone": "123",
                            "birthDate": "2022-04-14",
                            "description": "string",
                            "companyUser": true
                            });*/
                            signupWithAll(widget.userData);

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1920),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }


  signupWithAll(Map data) async {

    var headers = {
      'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers" : "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods" : "POST,GET, HEAD",
    };
    //var response = await http.post(Uri.parse("http://api.swapjob.tk/SwapJob/auth/signin"), body: convert.jsonEncode(data));
    var request = http.Request(
        'POST', Uri.parse('http://localhost/auth/signup'));
    print(data.values.elementAt(0));
    print(data.values.elementAt(1));
    request.body = json.encode(data);
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      bool success = await performLogin(data.values.elementAt(0), data.values.elementAt(1));
      if (success) {
        Future<List<Offer>> offers = getOffers();
        offers.then((offers) {
          if (offers != null) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
          }
        });
      } else {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Server error")));
        });
      }
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


