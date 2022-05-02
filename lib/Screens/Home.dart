import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swapjob/Screens/LikesPage.dart';
import 'package:swapjob/Screens/ProfilePage.dart';
import 'package:swapjob/Screens/ExplorePage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
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
      children: [ExplorePage(), LikesPage(), AccountPage()]
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
