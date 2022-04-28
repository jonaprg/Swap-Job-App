import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:tinder_clone/Models/tinder_clone_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<ScaffoldState> _scaffoldkey =  GlobalKey<ScaffoldState>() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    //Theme.of(context).accentColor,
                    //Theme.of(context).secondaryHeaderColor,
                    Theme.of(context).primaryColor
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: const [1.0])),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Center(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Icon(
                            Icons.access_alarm_outlined,
                            color: Colors.white,
                            size: ScreenUtil().setSp(5.0),
                          ),
                           SizedBox(width: ScreenUtil().setWidth(10.0)),
                           Text(
                            "SWAP JOB",
                            style:  TextStyle(
                                fontSize: ScreenUtil().setSp(5.0),
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ))),
               Expanded(
                  flex: 3,
                  child:  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(75.0)),
                    child:  Column(
                      children: <Widget>[
                         const Text(
                          'OLA',
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                         SizedBox(height: ScreenUtil().setHeight(50.0)),
                         SizedBox(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(105.0),
                          child:  ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreen()));
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                 Text(
                                  "LOG IN WITH PHONE NUMBER",
                                  style:  TextStyle(
                                      color: Colors.grey, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                        ),
                         SizedBox(height: ScreenUtil().setHeight(30.0)),
                         SizedBox(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(105.0),
                           child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                 Text(
                                  "LOG IN WITH FACEBOOK",
                                  style:  TextStyle(
                                      color: Colors.white, wordSpacing: 1.2),
                                )
                              ],
                            ),
                          ),
                         SizedBox(height: ScreenUtil().setHeight(70.0)),
                         Text(
                          "Trouble logging in?",
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(50.0),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}