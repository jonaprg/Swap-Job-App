import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth/LoginSignUpScreen.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1),(){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginSignUpScreen())) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context) ;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          width: ScreenUtil().setWidth(200.0),
          height: ScreenUtil().setHeight(200.0),
          image: const AssetImage('images/icon_swapjob.png'),
        ),
      ),
    );
  }
}