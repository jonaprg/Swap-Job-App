import 'Skill.dart';
import 'Preference.dart';

class Offer {
  late var id;
  late String title;
  late String description;
  late var salary;
  late bool isRemote;
  late bool isVisible;
  late int labour;
  late List<Skill> skillList;
  late List<Preference> preferenceList;

  Offer(this.id, this.title, this.description, this.salary, this.isRemote,
      this.isVisible, this.labour, this.skillList, this.preferenceList);

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    description = json['description'] as String;
    salary = json['salary'];
    isRemote = json['isRemote'] as bool;
    isVisible = json['isVisible'] as bool;
    labour = json['labour'] as int;
    skillList = json['skillList'] as List<Skill>;
    preferenceList = json['preferenceList'] as List<Preference>;
  }
}
