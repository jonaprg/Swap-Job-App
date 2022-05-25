import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swapjobapp/Screens/skillListScreen.dart';
import '/Screens/Home.dart';
import '/Utils/color.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/requests.dart';
import 'QuestionSkillScreen.dart';

class UserNameRScreen extends StatefulWidget {
  Map<String, dynamic> userData;

  UserNameRScreen(this.userData);

  @override
  _UserNameRScreenState createState() => _UserNameRScreenState();
}

class _UserNameRScreenState extends State<UserNameRScreen> {
  DateTime currentDate = DateTime.now();
  TextEditingController firstNameController = TextEditingController(text: 'jona');
  TextEditingController lastNameController = TextEditingController(text: 'jona');
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),

            child: IconButton(
              color: secondaryDarkBlueColor,
              icon: Icon(Icons.arrow_back_ios),
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
                    keyboardType: TextInputType.number,

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
                    keyboardType: TextInputType.phone,

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
                  /*Column(
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
                  ),*/
                  TextFormField(
                    controller: birthDateController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "BirthDate | YYYY-MM-DD",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        value = birthDateController.text;
                      });
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Description",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        value = descriptionController.text;
                      });
                    },
                  ),
                ]),
              ),
              firstNameController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty
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
                            /*widget.userData.addAll({
                              "firstName": firstNameController.text,
                              "lastName": lastNameController.text,
                              "postalCode":
                                  int.parse(postalCodeController.text),
                              "phone": phoneController.text,
                              "birthDate": birthDateController.text,
                              "description": descriptionController.text,
                              "companyUser": true
                            });*/
                            widget.userData.addAll({
                              "firstName": "string",
                              "lastName": "string",
                              "postalCode": 0,
                              "phone": "string",
                              "birthDate": "1997-11-05",
                              "description": "string",
                              "companyUser": true

                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QuestionSkillScreen(widget.userData)),
                            );
                            //signupWithAll(widget.userData);
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

  signupWithAll(Map data) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request =
        http.Request('POST', Uri.parse('http://localhost/auth/signup'));

    request.body = json.encode(data);
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      bool success = await performLogin(
          data.values.elementAt(0), data.values.elementAt(1));
      if (success) {

      } else {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Server error")));
        });
      }
    } else {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Error, retry again")));
      });
    }
  }
}
