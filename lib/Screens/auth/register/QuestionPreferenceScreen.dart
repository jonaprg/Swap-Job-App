import 'package:flutter/material.dart';
import 'package:swapjobapp/Model/Skill.dart';
import '/Screens/Home.dart';
import '/Utils/color.dart';
import '../../../Utils/requests.dart';

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
  RangeValues _currentSalaryValues = const RangeValues(0, 24000);
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
                    padding: EdgeInsetsDirectional.fromSTEB(2, 10, 2, 2),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.orange, size: 20),
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
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Que preferencias quieres?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  const Padding(
                    child: Text(
                      " | PASO 4 DE 4",
                      style: TextStyle(fontSize: 15),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Distancia | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _currentDistanceValues.start.truncate().toString() + " km a " +
                        _currentDistanceValues.end.truncate().toString() +" km",
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: RangeSlider(
                        activeColor:  Color(0xffffb703),
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
                    'Salario | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _currentSalaryValues.start.truncate().toString()
                        +"€ a "+ _currentSalaryValues.end.truncate().toString() +"€",
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
                        activeColor:  Color(0xffffb703),
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
                    'Horas de trabajo | ',
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _currentLabourValues.start.toString() + "h a "
                        + _currentLabourValues.end.toString() + "h ",
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
                        activeColor:  Color(0xffffb703),
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
                    'Presencialidad | ',
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
                        activeColor:  Color(0xffffb703),
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
                          "REGISTRAR",
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
                        'companyUser': false,
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
                            'lowThreshold': _currentSalaryValues.start.truncate(),
                            'highThreshold': _currentSalaryValues.end.truncate(),
                            'value': 0,
                          },
                          {
                            'title': 'labour',
                            'lowThreshold': _currentLabourValues.start.truncate(),
                            'highThreshold': _currentLabourValues.end.truncate(),
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
    bool successSingUp = await register(data);
    if (successSingUp) {
      bool successSignIn = await performLogin(
          data.values.elementAt(0), data.values.elementAt(1));
      if (successSignIn) {
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
