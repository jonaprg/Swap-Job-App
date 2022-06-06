import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swapjobapp/Screens/auth/LoginSignUpScreen.dart';
import '../Model/Preference.dart';
import '/Screens/EditProfile.dart';
import '/Utils/color.dart';
import '/Utils/requests.dart';
import 'package:file_picker/file_picker.dart';
import '../Model/User.dart';
import 'EditPreferenceScreen.dart';
import 'EditSkillScreen.dart';

class ProfilePage extends StatefulWidget {
  late Future<List<User>> itemsUser;
  ProfilePage(this.itemsUser, {Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late List<User> user;
  late List<Preference> _pref;
  int itemLength = 0;


  FutureOr onGoBack(dynamic value) {
    widget.itemsUser = getUserProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: FutureBuilder<List<User>>(
          future: widget.itemsUser,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Empty Profile"),
              );
            } else if (snapshot.hasData) {
              user = snapshot.data!;
              return SafeArea(

                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            user[0].phone,
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
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
                                                    style: const TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  child: Text(
                                                    "Status: ",
                                                    style: const TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),

                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  child: Text(
                                                    user[0].status.title,
                                                    style: const TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),

                                                ),
                                              ],
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
                                                    user[0].birthDate.toString().substring(0, 10),
                                                    style: const TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xFF0F1113),
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),

                                                ),
                                              ],
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
                                children: const [
                                  Text(
                                    'Descripción',
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
                                        style: const TextStyle(
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
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Habilidades',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Color(0xFF090F13),
                                size: 20,
                              ),
                              onPressed: ()  {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditSkillScreen(user[0].skill)),
                                ).then((onGoBack));
                              },
                            ),
                          ],
                        ),
                      ),
                      user[0].skill.isNotEmpty ?
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: user[0]
                                        .skill
                                        .asMap()
                                        .keys
                                        .toList()
                                        .map((indexUserSkill) {
                                      return

                                        Chip(
                                          labelPadding: EdgeInsets.all(2.0),
                                          label: Text(
                                            user[0].skill[indexUserSkill].title,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          backgroundColor: thirdBlueColor,
                                          elevation: 3.0,
                                          shadowColor: Colors.grey[60],
                                          padding: EdgeInsets.all(8.0),
                                        );

                                    }).toList(),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          : Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: primaryOrangeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 0),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Text("No hay habilidades",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Preferencias',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFF090F13),
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPreferenceScreen(user[0].preference)),
                                ).then((onGoBack));
                              },
                            ),
                          ],
                        ),
                      ),
                      user[0].preference.isNotEmpty ?
                            Row(
                          children : <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: thirdBlueColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x39000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Text(
                                          user[0].preference[0].title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF0F1113),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      user[0].preference[0].title != 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text(
                                            user[0].preference[0].lowThreshold.toString()
                                                + " a " +
                                                user[0].preference[0].highThreshold.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ):
                                      SizedBox(height: 0),
                                      user[0].preference[0].title == 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text((() {
                                            if (user[0].preference[0].value == 0) {
                                              return "Presencial";
                                            } else if (user[0].preference[0].value == 0.5) {
                                              return "Lo que quieran";
                                            }
                                            return "Remoto";
                                          })(), textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ),
                                      )
                                          : SizedBox(height: 0)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: thirdBlueColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x39000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Text(
                                          user[0].preference[1].title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF0F1113),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      user[0].preference[1].title != 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text(
                                            user[0].preference[1].lowThreshold.toString()
                                                + " a " +
                                                user[0].preference[1].highThreshold.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ):
                                      SizedBox(height: 0),
                                      user[0].preference[1].title == 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text((() {
                                            if (user[0].preference[1].value == 0) {
                                              return "Presencial";
                                            } else if (user[0].preference[1].value == 0.5) {
                                              return "Lo que quieran";
                                            }
                                            return "Remoto";
                                          })(), textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ),
                                      )
                                          : SizedBox(height: 0)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: thirdBlueColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x39000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Text(
                                          user[0].preference[2].title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF0F1113),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      user[0].preference[2].title != 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text(
                                            user[0].preference[2].lowThreshold.toString()
                                                + " a " +
                                                user[0].preference[2].highThreshold.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ):
                                      SizedBox(height: 0),
                                      user[0].preference[2].title == 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text((() {
                                            if (user[0].preference[2].value == 0) {
                                              return "Presencial";
                                            } else if (user[0].preference[2].value == 0.5) {
                                              return "Lo que quieran";
                                            }
                                            return "Remoto";
                                          })(),textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ),
                                      )
                                          : SizedBox(height: 0)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: thirdBlueColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x39000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                        child: Text(
                                          user[0].preference[3].title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF0F1113),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      user[0].preference[3].title != 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text(
                                            user[0].preference[3].lowThreshold.toString()
                                                + " a " +
                                                user[0].preference[3].highThreshold.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ):
                                      SizedBox(height: 0),
                                      user[0].preference[3].title == 'remote' ?
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                          child: Text((() {
                                            if (user[0].preference[3].value == 0) {
                                              return "Presencial";
                                            } else if (user[0].preference[3].value == 0.5) {
                                              return "Lo que quieran";
                                            }
                                            return "Remoto";
                                          })(), textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),),
                                        ),
                                      )
                                          : SizedBox(height: 0)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ])
                          : Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: primaryOrangeColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 12, 20, 0),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Text("No hay preferencias",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ],
                                ),
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
      floatingActionButton: SpeedDial(
          icon: Icons.settings,
          backgroundColor: primaryOrangeColor,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.edit),
              label: 'Edit',
              backgroundColor: Colors.amberAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage(user)),
                ).then((onGoBack));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.logout),
              label: 'Logout',
              backgroundColor: Colors.amberAccent,
              onTap: ()
                async {
                  SharedPreferences
                  shPre =
                      await SharedPreferences
                      .getInstance();
                  shPre.remove(
                      'accessToken');
                  Navigator.of(
                      context)
                      .pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder:
                              (context) =>
                              LoginSignUpScreen()),
                          (route) =>
                      false);
                }
            ),
            SpeedDialChild(
              child: const Icon(Icons.delete_forever),
              label: 'Delete account',
              backgroundColor: Colors.amberAccent,
                onTap: () async {
                  if (await deleteUser()) {
                    SharedPreferences
                    shPre =
                    await SharedPreferences
                        .getInstance();
                    shPre.clear();
                    Navigator.of(
                        context)
                        .pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginSignUpScreen()),
                            (route) =>
                        false);
                  } else {
                    ScaffoldMessenger
                        .of(context)
                        .showSnackBar(
                      SnackBar(
                        content:
                        const Text(
                            'NOT REMOVE USER, TRY AGAIN'),
                        duration: const Duration(
                            milliseconds:
                            1500),
                        width:
                        300.0, // Width of the SnackBar.
                        padding:
                        const EdgeInsets
                            .symmetric(
                          horizontal:
                          10.0, // Inner padding for SnackBar content.
                        ),
                        behavior:
                        SnackBarBehavior
                            .floating,
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              10.0),
                        ),
                      ),
                    );
                  }
                }
            ),
            SpeedDialChild(
              child: const Icon(Icons.upload_file),
              label: 'Subir titulo',
              backgroundColor: Colors.blueAccent,
              onTap: () async {
                try {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if(result != null) {
                    File selectedfile = File(result.files.single.path.toString());
                    uploadFile(selectedfile, false);
                  }
                } on PlatformException catch (e) {
                  print("Unsupported operation" + e.toString());
                } catch (ex) {
                  print(ex);
                }
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.upload_file),
              label: 'Subir Currículum',
              backgroundColor: Colors.blueAccent,
              onTap: () async {
                try {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if(result != null) {
                    File selectedfile = File(result.files.single.path.toString());
                    uploadFile(selectedfile, true);
                  }
                } on PlatformException catch (e) {
                  print("Unsupported operation" + e.toString());
                } catch (ex) {
                  print(ex);
                }
              },
            ),
          ]),
    );
  }
}
