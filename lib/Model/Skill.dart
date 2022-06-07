class Skill {
  final int id;
  final String title;
  final String description;

  const Skill({
    required this.id,
    required this.title,
    required this.description
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
    id : json['id'],
    title : json['title'],
    description : json['description'],
    );
  }
}
