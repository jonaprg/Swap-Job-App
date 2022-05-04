import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  /*const EditProfilePageWidget({
    //required Key key,
    //this.user,
  }) : super(key: key);*/

  //final UsersRecord user;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () async {
                      /*final usersUpdateData = createUsersRecordData(
                        displayName: textController1.text,
                        username: textController2.text,
                        website: textController3.text,
                        bio: textController4.text,
                      );
                      await widget.user.reference.update(usersUpdateData);*/
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0x55EEEEEE),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          //controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          ),
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0x55EEEEEE),
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
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Username',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          //controller: textController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,

                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          ),
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0x55EEEEEE),
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
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Website',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          //controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          ),
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0x55EEEEEE),
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
              padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Bio',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          //controller: textController4,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          ),
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
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
    );
  }
}
