import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjobapp/Screens/auth/LoginSignUpScreen.dart';
import '/Screens/EditProfile.dart';
import '/Utils/color.dart';
import '/Utils/requests.dart';

import '../Model/User.dart';

class ProfilePage extends StatefulWidget {
  late Future<List<User>> itemsUser;
  ProfilePage(this.itemsUser);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late List<User> user;

  int itemLength = 0;
  @override
  void initState() {
    setState(() {
      widget.itemsUser = getUserProfile();
    });
    super.initState();

  }

  FutureOr onGoBack(dynamic value) {
    widget.itemsUser = getUserProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: FutureBuilder<List<User>>(
          future: widget.itemsUser,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print({snapshot.error});
              return Center(
                child: Text("Error snapshot of Profile"),
              );
            } else if (snapshot.hasData) {
              user = snapshot.data!;
              return SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x230F1113),
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user[0].firstName +
                                                " " +
                                                user[0].lastName,
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "Phone: " + user[0].phone,
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  child: Text(
                                                    user[0].email,
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxHeight: 32,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryOrangeColor,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: Text(
                                                user[0].status.title,
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          170, 10, 10, 20),

                                      child: Column(

                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: <Widget>[
                                                        ListTile(
                                                          leading: new Icon(Icons.logout),
                                                          title: new Text('Logout'),
                                                          onTap: () async {
                                                            SharedPreferences shPre = await SharedPreferences.getInstance();
                                                            shPre.setString('accessToken', '');
                                                            shPre.clear();
                                                            Navigator.of(context).pushAndRemoveUntil(
                                                                MaterialPageRoute(builder: (context) => LoginSignUpScreen()),
                                                                    (route) => false);
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: new Icon(Icons.visibility_off),
                                                          title: new Text('Visible'),
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                        ),
                                                        ListTile(
                                                          leading: new Icon(Icons.delete_forever),
                                                          title: new Text('Remove account'),
                                                          onTap: () async {
                                                            if(await deleteUser()) {
                                                              SharedPreferences shPre = await SharedPreferences
                                                                  .getInstance();
                                                              shPre.clear();
                                                              Navigator.of(
                                                                  context)
                                                                  .pushAndRemoveUntil(
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          LoginSignUpScreen()),
                                                                      (route) => false);
                                                            } else {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(
                                                                    content: const Text('NOT REMOVE USER, TRY AGAIN'),
                                                                    duration: const Duration(milliseconds: 1500),
                                                                    width: 300.0, // Width of the SnackBar.
                                                                    padding: const EdgeInsets.symmetric(
                                                                      horizontal:
                                                                      10.0, // Inner padding for SnackBar content.
                                                                    ),
                                                                    behavior: SnackBarBehavior.floating,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                    ),
                                                                  ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black),
                                            child: Icon(
                                              Icons.settings,
                                              color: Colors.white,
                                              size: 24.0,
                                              semanticLabel: 'Settings',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF0F1113),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Text(
                                        user[0].description,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF0F1113),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Skill',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ), //SKILL NAME
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  2, 2, 2, 2),
                                              child:
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16,
                                                          12,
                                                          16,
                                                          0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 32,
                                                            constraints:
                                                            BoxConstraints(
                                                              maxHeight:
                                                              32,
                                                            ),
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Color(
                                                                  0xFF39D2C0),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                  4,
                                                                  color: Color(
                                                                      0x32171717),
                                                                  offset: Offset(
                                                                      0,
                                                                      2),
                                                                )
                                                              ],
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  30),
                                                            ),
                                                            child:
                                                            Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  8,
                                                                  0,
                                                                  8,
                                                                  0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0,
                                                                        0,
                                                                        12,
                                                                        0),
                                                                    child:
                                                                    Text(
                                                                      'Available',
                                                                      style:
                                                                      TextStyle(
                                                                        fontFamily: 'Outfit',
                                                                        color: Color(0xFF0F1113),
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ), //SKILLS
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Preference',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ), //preference
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                )),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 2, 2, 2),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 12, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 32,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight: 32,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF39D2C0),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x32171717),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          12,
                                                                          0),
                                                                  child: Text(
                                                                    'Available',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF0F1113),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ),
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage(user)),
            ).then((onGoBack));
        },
        backgroundColor: primaryOrangeColor,
        child: const Icon(Icons.edit),
      ),

    );
  }
}
