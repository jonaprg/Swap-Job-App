/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjob/Screens/auth/LoginSignUpScreen.dart';

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
/import 'package:swipe_stack/swipe_stack.dart';
import 'package:swapjob/Screens/InfoScreen.dart';
//import 'package:swapjob/Screens/Tab.dart';
import 'package:swapjob/Model/User.dart';
import 'package:swapjob/Utils/color.dart';


List userRemoved = [];
int countswipe = 1;

class CardPictures extends StatefulWidget {
  final List<User> users;
  final User currentUser;
  final int swipedcount;
  // Map items;
  const CardPictures(this.currentUser, this.users, this.swipedcount);


  @override
  _CardPicturesState createState() => _CardPicturesState();
}

class _CardPicturesState extends State<CardPictures>
    with AutomaticKeepAliveClientMixin<CardPictures> {

  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }
  checkLoginStatus() async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => LoginSignUpScreen()),
              (Route<dynamic> route) => false);
    }
  }

  // TabbarState state = TabbarState();
  bool onEnd = false;

  GlobalKey<SwipeStackState> swipeKey = GlobalKey<SwipeStackState>();
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: primaryOrangeColor,
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: Colors.white),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          child: Stack(
            children: [
              AbsorbPointer(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * .78,
                      width: MediaQuery.of(context).size.width,
                      child:
                      //onEnd ||
                      widget.users.length == 0
                          ? Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: secondaryDarkBlueColor,
                                radius: 40,
                              ),
                            ),
                            Text(
                              "There's no one new around you.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: secondaryDarkBlueColor,
                                  decoration: TextDecoration.none,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      )
                          : SwipeStack(
                        key: swipeKey,
                        children: widget.users.map((index) {
                          // User user;
                          return SwiperItem(builder:
                              (SwiperPosition position,
                              double progress) {
                            return Material(
                                elevation: 5,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                child: Container(
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(
                                            Radius.circular(30)),
                                        child: Swiper(
                                          customLayoutOption:
                                          CustomLayoutOption(
                                            startIndex: 0,
                                          ),
                                          key: UniqueKey(),
                                          physics:
                                          NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context,
                                              int index2) {
                                            return Container(
                                              height: MediaQuery.of(
                                                  context)
                                                  .size
                                                  .height *
                                                  .78,
                                              width: MediaQuery.of(
                                                  context)
                                                  .size
                                                  .width,
                                              child:
                                              CachedNetworkImage(
                                                imageUrl:
                                                index.imageUrl[
                                                index2] ??
                                                    "",
                                                fit: BoxFit.cover,
                                                useOldImageOnUrlChange:
                                                true,
                                                placeholder: (context,
                                                    url) =>
                                                    CupertinoActivityIndicator(
                                                      radius: 20,
                                                    ),
                                                errorWidget: (context,
                                                    url, error) =>
                                                    Icon(Icons.error),
                                              ),
                                              // child: Image.network(
                                              //   index.imageUrl[index2],
                                              //   fit: BoxFit.cover,
                                              // ),
                                            );
                                          },
                                          itemCount:
                                          index.imageUrl.length,
                                          pagination: new SwiperPagination(
                                              alignment: Alignment
                                                  .bottomCenter,
                                              builder: DotSwiperPaginationBuilder(
                                                  activeSize: 13,
                                                  color:
                                                  secondaryDarkBlueColor,
                                                  activeColor:
                                                  primaryOrangeColor)),
                                          control: new SwiperControl(
                                            color: primaryOrangeColor,
                                            disableColor:
                                            secondaryDarkBlueColor,
                                          ),
                                          loop: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(
                                            48.0),
                                        child: position.toString() ==
                                            "SwiperPosition.Left"
                                            ? Align(
                                          alignment: Alignment
                                              .topRight,
                                          child:
                                          Transform.rotate(
                                            angle: pi / 8,
                                            child: Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape
                                                      .rectangle,
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors
                                                          .red)),
                                              child: Center(
                                                child: Text(
                                                    "NOPE",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .red,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize:
                                                        32)),
                                              ),
                                            ),
                                          ),
                                        )
                                            : position.toString() ==
                                            "SwiperPosition.Right"
                                            ? Align(
                                          alignment:
                                          Alignment
                                              .topLeft,
                                          child: Transform
                                              .rotate(
                                            angle: -pi / 8,
                                            child:
                                            Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape
                                                      .rectangle,
                                                  border: Border.all(
                                                      width:
                                                      2,
                                                      color:
                                                      Colors.lightBlueAccent)),
                                              child: Center(
                                                child: Text(
                                                    "LIKE",
                                                    style: TextStyle(
                                                        color:
                                                        Colors.lightBlueAccent,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 32)),
                                              ),
                                            ),
                                          ),
                                        )
                                            : Container(),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            bottom: 10),
                                        child: Align(
                                            alignment:
                                            Alignment.bottomLeft,
                                            child: ListTile(
                                                onTap: () {
                                                  showDialog(
                                                      barrierDismissible:
                                                      false,
                                                      context:
                                                      context,
                                                      builder:
                                                          (context) {
                                                        return Info(
                                                            index,
                                                            widget
                                                                .currentUser,
                                                            swipeKey);
                                                      });
                                                },
                                                title: Text(
                                                  "name, age",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                                subtitle: Text(
                                                  "address",
                                                  style: TextStyle(
                                                    color:
                                                    Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ))),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                        }).toList(growable: true),
                        threshold: 30,
                        maxAngle: 100,
                        //animationDuration: Duration(milliseconds: 400),
                        visibleCount: 5,
                        historyCount: 1,
                        stackFrom: StackFrom.Right,
                        translationInterval: 5,
                        scaleInterval: 0.08,
                        onSwipe: (int index,
                            SwiperPosition position) async {
                          print(position);
                          print(widget.users[index].name);
                          if (position == SwiperPosition.Left) {


                            if (index < widget.users.length) {
                              userRemoved.clear();
                              setState(() {
                                userRemoved.add(widget.users[index]);
                                widget.users.removeAt(index);
                              });
                            }
                          } else if (position ==
                              SwiperPosition.Right) {
                            if (likedByList
                                .contains(widget.users[index].id)) {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    Future.delayed(
                                        Duration(milliseconds: 1700),
                                            () {
                                          Navigator.pop(ctx);
                                        });
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 80),
                                      child: Align(
                                        alignment:
                                        Alignment.topCenter,
                                        child: Card(
                                          child: Container(
                                            height: 100,
                                            width: 300,
                                            child: Center(
                                              child: Text(
                                                "It's a match\n With ${widget.users[index].name}",
                                                textAlign:
                                                TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                    primaryOrangeColor,
                                                    fontSize: 30,
                                                    decoration:
                                                    TextDecoration
                                                        .none),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });

                            }


                            if (index < widget.users.length) {
                              userRemoved.clear();
                              setState(() {
                                userRemoved.add(widget.users[index]);
                                widget.users.removeAt(index);
                              });
                            }
                          } else
                            debugPrint("onSwipe $index $position");
                        },
                        onRewind:
                            (int index, SwiperPosition position) {
                          swipeKey.currentContext
                              ?.dependOnInheritedWidgetOfExactType();
                          widget.users.insert(index, userRemoved[0]);
                          setState(() {
                            userRemoved.clear();
                          });
                          debugPrint("onRewind $index $position");
                          print(widget.users[index].id);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            widget.users.length != 0
                                ? FloatingActionButton(
                                heroTag: UniqueKey(),
                                backgroundColor: Colors.white,
                                child: Icon(
                                  userRemoved.length > 0
                                      ? Icons.replay
                                      : Icons.not_interested,
                                  color: userRemoved.length > 0
                                      ? Colors.amber
                                      : secondaryDarkBlueColor,
                                  size: 20,
                                ),
                                onPressed: () {
                                  if (userRemoved.length > 0) {
                                    swipeKey.currentState?.rewind();
                                  }
                                })
                                : FloatingActionButton(
                              heroTag: UniqueKey(),
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.refresh,
                                color: Colors.green,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                            FloatingActionButton(
                                heroTag: UniqueKey(),
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                onPressed: () {
                                  if (widget.users.length > 0) {
                                    print("object");
                                    swipeKey.currentState?.swipeLeft();
                                  }
                                }),
                            FloatingActionButton(
                                heroTag: UniqueKey(),
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.lightBlueAccent,
                                  size: 30,
                                ),
                                onPressed: () {
                                  if (widget.users.length > 0) {
                                    swipeKey.currentState?.swipeRight();
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
//import 'package:tinder_clone/details_page.dart';

//import 'curved_painter.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:swipable_stack/swipable_stack.dart';
import "dart:ui";

import 'auth/LoginScreen.dart';

//import 'match_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexPage = 0;
  int indexType = 0;
  int isCurrentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: EdgeInsets.only(bottom: 60),
            width: double.infinity,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                end: const Alignment(0.0, 0.4),
                begin: const Alignment(0.0, -1),
                colors: <Color>[
                  Colors.pink,
                  Colors.deepOrange,
                ],
              ),
            ),
          ),
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.31,
            ),

          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                toolbarHeight: 56,
                titleSpacing: 0,
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'People Nearby',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 42,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Image.asset(
                            "images/icon_swapjob.png",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: AspectRatio(
                        aspectRatio: 0.7,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              "images/icon_swapjob.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 104),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      margin: EdgeInsets.fromLTRB(16, 16, 10, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.deepOrange,
                          size: 28,
                        ),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: 64,
                      margin: EdgeInsets.fromLTRB(10, 16, 16, 16),
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          end: const Alignment(0.0, 0.4),
                          begin: const Alignment(0.0, -1),
                          colors: <Color>[
                            Colors.pink,
                            Colors.deepOrange,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginSignUpScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

*/