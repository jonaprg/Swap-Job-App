import 'Preference.dart';
import 'Skill.dart';
import 'Status.dart';

class SignUpRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final int postalCode;
  final String phone;
  final String birthDate;
  final String description;
  final List<Skill> skill;
  final List<Preference> preference;


  SignUpRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.postalCode,
    required this.phone,
    required this.birthDate,
    required this.description,
    required this.skill,
    required this.preference
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    var skillListUser = json['skillList'] as List;
    List<Skill> itemsSkillUser = skillListUser.map((i) => Skill.fromJson(i)).toList();
    var preferenceListUser = json['preferenceList'] as List;
    List<Preference> itemPreferenceUser = preferenceListUser.map((i) => Preference.fromJson(i)).toList();

    return SignUpRequest(
      email : json['email'] as String,
      password : json['password'] as String,
      firstName : json['firstName'] as String,
      lastName : json['lastName'] as String,
      postalCode : json['postalCode'] as int,
      phone : json['phone'] as String,
      birthDate : json['birthDate'] as String,
      description : json['description'] as String,
      skill : itemsSkillUser,
      preference : itemPreferenceUser,
    );
  }

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password,
    'firstName' : firstName,
    'lastName' : lastName,
    'postalCode' : postalCode,
    'phone' : phone,
    'birthDate' : birthDate,
    'description' : description,
    'companyUser' : true,
    'skills' : skill,
    'preference' : preference,
  };
}
