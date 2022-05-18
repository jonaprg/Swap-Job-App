import 'Preference.dart';
import 'Skill.dart';
import 'Status.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int postalCode;
  final String phone;
  final String birthDate;
  final String description;
  final bool isVisible;
  final Status status;
  final List<Skill> skill;
  final List<Preference> preference;


  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.postalCode,
    required this.phone,
    required this.birthDate,
    required this.isVisible,
    required this.description,
    required this.status,
    required this.skill,
    required this.preference
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var skillListUser = json['skillList'] as List;
    List<Skill> itemsSkillUser = skillListUser.map((i) => Skill.fromJson(i)).toList();
    var preferenceListUser = json['preferenceList'] as List;
    List<Preference> itemPreferenceUser = preferenceListUser.map((i) => Preference.fromJson(i)).toList();

    return User(
      id : json['id'] as int,
      firstName : json['firstName'] as String,
      lastName : json['lastName'] as String,
      email : json['email'] as String,
      postalCode : json['postalCode'] as int,
      phone : json['phone'] as String,
      birthDate : json['birthDate'] as String,
      isVisible : json['visible'] as bool,
      status: Status.fromJson(json['status']),
      description : json['description'] as String,
      skill : itemsSkillUser,
      preference : itemPreferenceUser,
    );
  }

}
