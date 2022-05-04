import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:swapjob/Screens/EditProfile.dart';

import '../Utils/account_json.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.40,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                account_json[0]['firstName'] + ", " + account_json[0]['lastName'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                account_json[0]['email'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                account_json[0]['phone'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                account_json[0]['description'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 15,
                                // changes position of shadow
                              ),
                            ]),
                        child:
                        IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: 'Information about the offer',
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfilePage()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "EDIT INFO",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
