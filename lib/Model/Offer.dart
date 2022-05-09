import 'dart:ffi';
import 'Skill.dart';
import 'Preference.dart';

class Offer {
  late var id;
  late String title;
  late String description;
  late Float salary;
  late bool isRemote;
  late bool isVisible;
  late int labour;
  late List<Skill> skillList;
  late List<Preference> preferenceList;

  Offer(this.id, this.title, this.description, this.salary, this.isRemote,
      this.isVisible, this.labour, this.skillList, this.preferenceList);

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'].parseLong();
    title = json['title'];
    description = json['description'];
    salary = json['salary'].parseFloat();
    isRemote = json['isRemote'].parseBool();
    isVisible = json['isVisible'].parseBool();
    labour = json['labour'].parseInt();
    skillList = json['skillList'];
    preferenceList = json['preferenceList'];
  }
}
