import 'package:flutter/material.dart';
import 'package:swapjob/Screens/auth/LoginScreen.dart';

import 'Model/User.dart';

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
      home : LoginScreen(),
    );
  }
}
