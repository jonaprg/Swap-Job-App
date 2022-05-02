import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swapjob/Screens/LikesPage.dart';
import 'package:swapjob/Screens/ProfilePage.dart';
import 'package:swapjob/Screens/ExplorePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:swapjob/Screens/auth/LoginScreen.dart';
import 'package:swapjob/Screens/auth/LoginSignUpScreen.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  late SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginSignUpScreen()), (Route<dynamic> route) => false);
    }
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
      children: [TextButton(
        onPressed: () {
          sharedPreferences.clear();
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginSignUpScreen()), (Route<dynamic> route) => false);
        },
        child: Text("Log Out", style: TextStyle(color: Colors.white)),
      ),
        ExplorePage(), LikesPage(), AccountPage()]
    );
  }

  getAppBar() {
    List bottomItems = [
      pageIndex == 0 ? "images/profile.png" : "images/profile.png",
      pageIndex == 1
          ? "images/home_active_icon.svg"
          : "images/home_icon.svg",
      pageIndex == 2
          ? "images/messages_active_icon.svg"
          : "images/messages_icon.svg",
      pageIndex == 3
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
