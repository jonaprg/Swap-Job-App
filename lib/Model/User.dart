import 'package:flutter/cupertino.dart';

class User {
  final String id;
  List imageUrl = [];
  final String name;
  /*
  final bool isBlocked;
  String address;
  final Map coordinates;
  final List sexualOrientation;
  final String gender;
  final String showGender;
  final int age;
  final String phoneNumber;
  int maxDistance;
  final Map ageRange;
  final Map editInfo;

  var distanceBW;*/

  User({
    required this.id,
    //required this.age,
    //required this.address,
    //required this.isBlocked,
    //required this.coordinates,
    required this.name,
    required this.imageUrl,
    //required this.phoneNumber,
    //required this.gender,
    //required this.showGender,
    //required this.ageRange,
    //required this.maxDistance,
    //required this.editInfo,
    //this.distanceBW,
    //required this.sexualOrientation,
  });
  factory User.fromJson() {
    // DateTime date = DateTime.parse(doc["user_DOB"]);
    return User(
        id: '1',
      name: 'hola',
      imageUrl: List.generate(10, (index) => null)
    );
  }
}
