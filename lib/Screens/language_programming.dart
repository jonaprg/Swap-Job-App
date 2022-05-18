import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swapjob/Utils/color.dart';
import 'package:swapjob/Utils/snackbar.dart';

class Gender extends StatefulWidget {
  final Map<String, dynamic> userData;
  Gender(this.userData);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool man = false;
  bool woman = false;
  bool other = false;
  bool select = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              dispose();
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: <Widget>[
          Padding(
            child: Text(
              "I am a",
              style: TextStyle(fontSize: 40),
            ),
            padding: EdgeInsets.only(left: 50, top: 120),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  highlightedBorderColor: primaryOrangeColor,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: Center(
                        child: Text("MAN",
                            style: TextStyle(
                                fontSize: 20,
                                color: man ? secondaryDarkBlueColor : thirdBlueColor,
                                fontWeight: FontWeight.bold))),
                  ),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: man ? secondaryDarkBlueColor : thirdBlueColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    setState(() {
                      woman = false;
                      man = true;
                      other = false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .065,
                      width: MediaQuery.of(context).size.width * .75,
                      child: Center(
                          child: Text("WOMAN",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: woman ? secondaryDarkBlueColor : thirdBlueColor,
                                  fontWeight: FontWeight.bold))),
                    ),
                    borderSide: BorderSide(
                      color: woman ? secondaryDarkBlueColor : thirdBlueColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      setState(() {
                        woman = true;
                        man = false;
                        other = false;
                      });
                      // Navigator.push(
                      //     context, CupertinoPageRoute(builder: (context) => OTP()));
                    },
                  ),
                ),
                OutlineButton(
                  focusColor: secondaryDarkBlueColor,
                  highlightedBorderColor: secondaryDarkBlueColor,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .065,
                    width: MediaQuery.of(context).size.width * .75,
                    child: Center(
                        child: Text("OTHER",
                            style: TextStyle(
                                fontSize: 20,
                                color: other ? secondaryDarkBlueColor : thirdBlueColor,
                                fontWeight: FontWeight.bold))),
                  ),
                  borderSide: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: other ? secondaryDarkBlueColor : thirdBlueColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    setState(() {
                      woman = false;
                      man = false;
                      other = true;
                    });
                    // Navigator.push(
                    //     context, CupertinoPageRoute(builder: (context) => OTP()));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0, left: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Checkbox(
                  activeColor: secondaryDarkBlueColor,
                  value: select,
                  onChanged: (newValue) {
                    setState(() {
                      select = newValue!;
                    });
                  },
                ),
                title: Text("Show my gender on my profile"),
              ),
            ),
          ),
          man || woman || other
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
                              secondaryDarkBlueColor.withOpacity(.5),
                              secondaryDarkBlueColor.withOpacity(.8),
                              secondaryDarkBlueColor,
                              secondaryDarkBlueColor
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
                  var userGender;
                  if (man) {
                    userGender = {
                      'userGender': "man",
                      'showOnProfile': select
                    };
                  } else if (woman) {
                    userGender = {
                      'userGender': "woman",
                      'showOnProfile': select
                    };
                  } else {
                    userGender = {
                      'userGender': "other",
                      'showOnProfile': select
                    };
                  }
                  widget.userData.addAll(userGender);
                  // print(userData['userGender']['showOnProfile']);
                  /*Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              SexualOrientation(widget.userData)));*/

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
                onTap: () {
                  CustomSnackbar.snackbar(
                      "Please select one", _scaffoldKey);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
