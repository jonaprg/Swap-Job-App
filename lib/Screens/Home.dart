import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swapjob/Model/Offer.dart';
import 'package:swapjob/Screens/MatchesPage.dart';
import 'package:swapjob/Screens/ProfilePage.dart';
import 'package:swapjob/Screens/ExplorePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:swapjob/Screens/auth/LoginScreen.dart';
import 'package:swapjob/Screens/auth/LoginSignUpScreen.dart';

import '../Model/UserMatches.dart';
import '../Utils/requests.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  late SharedPreferences sharedPreferences;
  late Future<List<UserMatch>> itemsMatches;
  late Future<List<Offer>> itemsOffers;


  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('accessToken') == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginSignUpScreen()), (Route<dynamic> route) => false);
    }
  }
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    setState(() {
      itemsMatches = getMatchesUser();
      itemsOffers = getOffers();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExplorePage(itemsOffers), MatchesPage(itemsMatches), ProfilePage()]
    );
  }

  getAppBar() {
    List bottomItems = [
      pageIndex == 0
          ? "images/home_active_icon.svg"
          : "images/home_icon.svg",
      pageIndex == 1
          ? "images/messages_active_icon.svg"
          : "images/messages_icon.svg",
      pageIndex == 2
          ? "images/account_active_icon.svg"
          : "images/account_icon.svg",
    ];
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                  itemsMatches = getMatchesUser();
                  itemsOffers = getOffers();
                });
              },
              icon: SvgPicture.asset(
                bottomItems[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
