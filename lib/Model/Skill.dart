class Skill {
  late int id;
  late String title;
  late String description;

  Skill(this.id, this.title, this.description);

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }
}
