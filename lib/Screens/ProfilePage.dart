import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swapjob/Utils/requests.dart';

import '../Model/User.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<User>> itemsTemp;
  late List<User> user;

  int itemLength = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      itemsTemp = getUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        body: FutureBuilder<List<User>>(
            future: itemsTemp,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(16, 0, 0, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user[0].lastName,
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              'phone',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        8, 8, 0, 0),
                                                    child: Text(
                                                      'email@gmail.commmm',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color: Color(0xFF0F1113),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
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
                                          color: Color(0xFF39D2C0),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x32171717),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                                child: Text(
                                                  'Available',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF0F1113),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.radio_button_checked_outlined,
                                                color: Colors.white,
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF0F1113),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
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
                                                                                20,
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
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
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
                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional.fromSTEB(
                                                          16, 12, 16, 0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 32,
                                                            constraints: BoxConstraints(
                                                              maxHeight: 32,
                                                            ),
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF39D2C0),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 4,
                                                                  color:
                                                                  Color(0x32171717),
                                                                  offset: Offset(0, 2),
                                                                )
                                                              ],
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  30),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  8, 0, 8, 0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(0,
                                                                        0, 12, 0),
                                                                    child: Text(
                                                                      'Available',
                                                                      style: TextStyle(
                                                                        fontFamily:
                                                                        'Outfit',
                                                                        color: Color(
                                                                            0xFF0F1113),
                                                                        fontSize: 20,
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
            }
        )
    );
  }
}
