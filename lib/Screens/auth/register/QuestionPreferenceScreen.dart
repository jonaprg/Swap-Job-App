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
  List<Skill> tags = [];
  List<int> skillId = [];

  QuestionPreferenceScreen(this.userData, this.tags);

  @override
  _QuestionPreferenceScreenState createState() =>
      _QuestionPreferenceScreenState();
}

class _QuestionPreferenceScreenState extends State<QuestionPreferenceScreen> {
  RangeValues _currentDistanceValues = const RangeValues(0, 10);
  RangeValues _currentSalaryValues = const RangeValues(0, 20);
  RangeValues _currentLabourValues = const RangeValues(20, 40);
  double _currentRemoteValues = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Map<String, dynamic> user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.orange, size: 16),
                        tooltip: 'Back',
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Que preferencias quieres?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Distance | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _currentDistanceValues.end.truncate().toString(),
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: RangeSlider(
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        max: 100,
                        values: _currentDistanceValues,
                        labels: RangeLabels(
                          _currentDistanceValues.start.round().toString(),
                          _currentDistanceValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues newValue) {
                          setState(() => _currentDistanceValues = newValue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Salary',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: RangeSlider(
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        max: 50000,
                        values: _currentSalaryValues,
                        labels: RangeLabels(
                          _currentSalaryValues.start.round().toString(),
                          _currentSalaryValues.end.round().toString(),
                        ),
                        divisions: 100,
                        onChanged: (RangeValues newValue) {
                          setState(() => _currentSalaryValues = newValue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Labour',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: RangeSlider(
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        max: 40,
                        min: 20,
                        values: _currentLabourValues,
                        labels: RangeLabels(
                          _currentLabourValues.start.round().toString(),
                          _currentLabourValues.end.round().toString(),
                        ),
                        divisions: 4,
                        onChanged: (RangeValues newValue) {
                          setState(() => _currentLabourValues = newValue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Remote',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Slider(
                        activeColor: Color(0xFF4B39EF),
                        inactiveColor: Color(0xFFF1F4F8),
                        min: 0,
                        max: 1,
                        value: _currentRemoteValues,
                        label: _currentRemoteValues.toString(),
                        divisions: 2,
                        onChanged: (double newValue) {
                          setState(() => _currentRemoteValues = newValue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
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
                          "REGISTER",
                          style: TextStyle(
                              fontSize: 15,
                              color: textColor,
                              fontWeight: FontWeight.bold),
                        ))),
                    onTap: () {
                      for (Skill item in widget.tags) {
                        widget.skillId.add(item.id);
                      }
                      user.addAll({
                        'email': widget.userData["email"],
                        'password': widget.userData["password"],
                        'firstName': widget.userData["firstName"],
                        'lastName': widget.userData["lastName"],
                        'postalCode': widget.userData["postalCode"],
                        'phone': widget.userData["phone"],
                        'birthDate': widget.userData["birthDate"],
                        'description': widget.userData["description"],
                        'companyUser': true,
                        'skillIdList': widget.skillId,
                        'preferenceIdList': [
                          {
                            'title': 'distance',
                            'lowThreshold': _currentDistanceValues.start.truncate(),
                            'highThreshold': _currentDistanceValues.end.truncate(),
                            'value': 0,
                          },
                          {
                            'title': 'salary',
                            'lowThreshold': _currentSalaryValues.start,
                            'highThreshold': _currentSalaryValues.end,
                            'value': 0,
                          },
                          {
                            'title': 'labour',
                            'lowThreshold': _currentLabourValues.start,
                            'highThreshold': _currentLabourValues.end,
                            'value': 0,
                          },
                          {
                            'title': 'remote',
                            'lowThreshold': 0,
                            'highThreshold': 0,
                            'value': _currentRemoteValues,
                          },
                        ],
                      });
                      setState(() {});
                      signUp(user);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUp(Map data) async {
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
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                (Route<dynamic> route) => false);
      } else {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Not login, try again!")));
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
