import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
  late TextEditingController textController5;
  late TextEditingController textController6;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    /*textController1 = TextEditingController(text: widget.user.displayName);
    textController2 = TextEditingController(text: widget.user.username);
    textController3 = TextEditingController(text: widget.user.website);
    textController4 = TextEditingController(text: widget.user.bio);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
// Generated code for this AppBar Widget...
            PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color(0xFF090F13),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'Edit Profile',
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
                actions: [],
                elevation: 0,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: textController1,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle:   TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  hintStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: textController2,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  hintStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFF0F1113),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: textController3,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  hintStyle: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: textController4,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  hintStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: textController5,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle:  TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  hintStyle:   TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF1F4F8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: textController6,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle:   TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  hintStyle:   TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                  ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: IconButton(

                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF090F13),
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
