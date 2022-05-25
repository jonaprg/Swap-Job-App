import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swapjobapp/Model/Skill.dart';
import 'package:swapjobapp/Screens/skillListScreen.dart';
import '/Screens/Home.dart';
import '/Utils/color.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/requests.dart';
import 'QuestionSkillScreen.dart';

class QuestionPreferenceScreen extends StatefulWidget {
  Map<String, dynamic> userData;

  QuestionPreferenceScreen(this.userData, List<Skill> tags);

  @override
  _QuestionPreferenceScreenState createState() => _QuestionPreferenceScreenState();
}

class _QuestionPreferenceScreenState extends State<QuestionPreferenceScreen> {

  TextEditingController distanceController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController labourController = TextEditingController();
  TextEditingController remoteController = TextEditingController();

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
