import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swapjobapp/Model/Skill.dart';
import '../Model/Preference.dart';
import '/Screens/Home.dart';
import '/Utils/color.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/requests.dart';

class EditPreferenceScreen extends StatefulWidget {
  List<Preference> userPreferences = [];

  EditPreferenceScreen(this.userPreferences);

  @override
  _EditPreferenceScreenState createState() =>
      _EditPreferenceScreenState();
}

class _EditPreferenceScreenState extends State<EditPreferenceScreen> {
  List<Preference> _pref = [];
  late RangeValues _currentDistanceValues;
  late RangeValues _currentSalaryValues;
  late RangeValues _currentLabourValues ;
  late double _currentRemoteValues;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    super.initState();

    setState(() {
    if(widget.userPreferences.isNotEmpty) {
      _currentDistanceValues = RangeValues(widget.userPreferences[0].lowThreshold, widget.userPreferences[0].highThreshold);
      _currentSalaryValues = RangeValues(widget.userPreferences[1].lowThreshold, widget.userPreferences[1].highThreshold);
      _currentLabourValues = RangeValues(widget.userPreferences[2].lowThreshold, widget.userPreferences[2].highThreshold);
      _currentRemoteValues = widget.userPreferences[3].value;
    }
    _currentDistanceValues = const RangeValues(0, 20);
    _currentSalaryValues = const RangeValues(10000, 20000);
    _currentLabourValues = const RangeValues(20, 25);
    _currentRemoteValues = 0;
    });
  }

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
                    _currentDistanceValues.start.truncate().toString() + " km to " +
                    _currentDistanceValues.end.truncate().toString() +" km",
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
                        activeColor: Color(0xffffb703),
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
                    'Salary | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _currentSalaryValues.start.truncate().toString()
                        +"€ to "+ _currentSalaryValues.end.truncate().toString() +"€",
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
                        activeColor: Color(0xffffb703),
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
                    'Labour | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _currentLabourValues.start.toString() + "hours to "
                        + _currentLabourValues.end.toString() + "hours ",
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
                        activeColor: Color(0xffffb703),
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
                    'Remote | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text((() {
                    if(_currentRemoteValues == 0){
                      return "Presencial";
                    }else if(_currentRemoteValues == 0.5) {
                      return "Lo que quieran";
                    }
                    return "Remoto";
                  })()),

                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Slider(
                        activeColor: Color(0xffffb703),
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
                                  primaryOrangeColor.withOpacity(.5),
                                  primaryOrangeColor.withOpacity(.8),
                                  primaryOrangeColor,
                                  primaryOrangeColor
                                ])),
                        height: MediaQuery.of(context).size.height * .065,
                        width: MediaQuery.of(context).size.width * .75,
                        child: Center(
                            child: Text(
                          "CONFIMAR",
                          style: TextStyle(
                              fontSize: 15,
                              color: textColor,
                              fontWeight: FontWeight.bold),
                        ))),
                    onTap: () {
                      Preference distance = Preference(
                          title : 'distance',
                          lowThreshold: _currentDistanceValues.start.truncate().toDouble(),
                          highThreshold: _currentDistanceValues.end.truncate().toDouble(),
                          value: 0);
                      Preference salary = Preference(
                          title : 'salary',
                          lowThreshold: _currentDistanceValues.start.truncate().toDouble(),
                          highThreshold: _currentDistanceValues.end.truncate().toDouble(),
                          value: 0);
                      Preference labour = Preference(
                          title : 'labour',
                          lowThreshold: _currentDistanceValues.start.truncate().toDouble(),
                          highThreshold: _currentDistanceValues.end.truncate().toDouble(),
                          value: 0);
                      Preference remote = Preference(
                          title : 'remote',
                          lowThreshold: 0,
                          highThreshold: 0,
                          value: _currentRemoteValues);

                      _pref.add(distance);
                      _pref.add(salary);
                      _pref.add(labour);
                      _pref.add(remote);
                      print(_pref);
                      var preferencesData = [
                        {
                          'title': 'distance',
                          'lowThreshold': _currentDistanceValues.start.truncate(),
                          'highThreshold': _currentDistanceValues.end.truncate(),
                          'value': 0,
                        },
                        {
                          'title': 'salary',
                          'lowThreshold': _currentSalaryValues.start.truncate(),
                          'highThreshold': _currentSalaryValues.end.truncate(),
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
                      ];
                      setPreferenceUser(_pref);
                      setState(() {});
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
  setPreferenceUser(List<Preference> preferenceUser) async {
    bool success = await requestSetPreferenceUser(preferenceUser);
    if (success) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          content: const Text('Sorry. Try again! Edit correctly preference/s'),
          duration: const Duration(milliseconds: 1500),
          width: 280.0, // Width of the SnackBar.
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, // Inner padding for SnackBar content.
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }
  }
}
