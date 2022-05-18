import 'Skill.dart';
import 'Preference.dart';

class Offer {
  final int id;
  final String title;
  final String description;
  final double salary;
  final bool isRemote;
  final bool isVisible;
  final int labour;
  final List<Skill> skillList;
  final List<Preference> preferenceList;
  final String companyName;
  final String companyImage;
  final String coordinates;

  const Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.isRemote,
    required this.isVisible,
    required this.labour,
    required this.skillList,
    required this.preferenceList,
    required this.companyName,
    required this.companyImage,
    required this.coordinates
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    var skillList = json['skillList'] as List;
    List<Skill> itemsList = skillList.map((i) => Skill.fromJson(i)).toList();
    var preferenceList = json['preferenceList'] as List;
    List<Preference> itemPreference = preferenceList.map((i) => Preference.fromJson(i)).toList();

    return Offer(
    id : json['id'] as int,
    title : json['title'] as String,
    description : json['description'] as String,
    salary : json['salary'],
    isRemote : json['isRemote'] as bool,
    isVisible : json['isVisible'] as bool,
    labour : json['labour'] as int,
    companyName : json['companyName'] as String,
    companyImage : json['companyImage'] as String,
    coordinates : json['coordinates'] as String,
    skillList : itemsList,
    preferenceList : itemPreference,
    );
  }

  @override
  String toString() {
    return 'Offer{id: $id, title: $title, description: $description, salary: $salary, isRemote: $isRemote, isVisible: $isVisible, labour: $labour, skillList: $skillList, preferenceList: $preferenceList, companyName: $companyName, companyImage: $companyImage, coordinates: $coordinates}';
  }
}
