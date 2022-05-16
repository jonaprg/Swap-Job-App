import 'Preference.dart';
import 'Skill.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int postalCode;
  final String phone;
  final DateTime birthDate;
  final bool isVisible;
  final String description;
  //final bool isCompanyUser;
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
    required this.skill,
    required this.preference
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var skillList = json['skillList'] as List;
    List<Skill> itemsSkill = skillList.map((i) => Skill.fromJson(i)).toList();
    var preferenceList = json['preferenceList'] as List;
    List<Preference> itemPreference = preferenceList.map((i) => Preference.fromJson(i)).toList();

    return User(
      id : json['id'] as int,
      firstName : json['firstName'] as String,
      lastName : json['lastName'] as String,
      email : json['email'] as String,
      postalCode : json['postalCode'] as int,
      phone : json['phone'] as String,
      birthDate : json['birthDate'] as DateTime,
      isVisible : json['visible'] as bool,
      description : json['description'] as String,
      skill : itemsSkill,
      preference : itemPreference,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, postalCode: $postalCode, phone: $phone, birthDate: $birthDate, isVisible: $isVisible, description: $description, skill: $skill, preference: $preference}';
  }
}
