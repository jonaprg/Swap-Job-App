import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/Offer.dart';
import '../Model/UserMatches.dart';
import '../Utils/requests.dart';
import 'ExplorePage.dart';
import 'MatchesPage.dart';
import 'ProfilePage.dart';
import 'auth/LoginSignUpScreen.dart';




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
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/messages_active_icon.svg"
          : "assets/images/messages_icon.svg",
      pageIndex == 2
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
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
