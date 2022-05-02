import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swapjob/Screens/auth/LoginScreen.dart';
//import 'package:tinder_clone/Models/tinder_clone_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:swapjob/Utils/color.dart';
import '../UserName.dart';
import 'email_verifaction.dart';

class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String name;
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.1),
                  topRight: Radius.circular(0.1)),
              color: Colors.white),
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 205,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withOpacity(.15)
                      ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      child: Column(),
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withOpacity(.2)
                      ])),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      child: const Center(
                          child: Text(
                        "SWAP JOB",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      )),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor
                      ])),
                    ),
                  ),
                ],
              ),
              Column(children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.blueAccent,
                                      Colors.blueAccent
                                    ])),
                            height: MediaQuery.of(context).size.height * .065,
                            width: MediaQuery.of(context).size.width * .8,
                            child: const Center(
                                child: Text(
                              "LOG IN WITH LINKEDIN",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                    ),
                  ),
                ),
                Container(),
                OutlinedButton(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: const Center(
                        child: Text("LOG IN WITH EMAIL",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                  onPressed: () {
                    bool updateNumber = false;
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [Colors.orange, Colors.orange])),
                            height: MediaQuery.of(context).size.height * .065,
                            width: MediaQuery.of(context).size.width * .8,
                            child: const Center(
                                child: Text(
                              "SIGN IN WITH EMAIL",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))),
                        onTap: () async {
                          bool updateNumber = false;
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => UserName()));
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
