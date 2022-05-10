import 'Skill.dart';
import 'Preference.dart';

class Offer {
  final int id;
  final String title;
  final String description;
  final int salary;
  final bool isRemote;
  final bool isVisible;
  final int labour;
  final List<Skill> skillList;
  final List<Preference> preferenceList;

  const Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.isRemote,
    required this.isVisible,
    required this.labour,
    required this.skillList,
    required this.preferenceList});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
    id : json['id'] as int,
    title : json['title'] as String,
    description : json['description'] as String,
    salary : json['salary'],
    isRemote : json['isRemote'] as bool,
    isVisible : json['isVisible'] as bool,
    labour : json['labour'] as int,
    skillList : json['skillList'] as List<Skill>,
    preferenceList : json['preferenceList'] as List<Preference>,
    );
  }
}
