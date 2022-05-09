import 'package:flutter/material.dart';
import 'package:swapjob/Previous/HomeScreen_Other.dart';
import 'package:swapjob/Screens/SplashScreen.dart';
import 'package:swapjob/Previous/TabsScreen_Other.dart';
import 'package:swapjob/Screens/auth/LoginScreen.dart';
import 'package:swapjob/Screens/auth/LoginSignUpScreen.dart';

import 'Model/Offer.dart';
import 'Model/User.dart';
import 'Screens/Home.dart';
import 'Utils/requests.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late final List<User> users;
  late final User currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWAP JOB',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 183, 3, 1.0),
      ),
      home : LoginSignUpScreen(),
    );
  }
}
