class Status {
  final int id;
  final String title;

  const Status({
    required this.id,
    required this.title,

  });

  factory Status.fromJson(Map<String, dynamic> json) {

    return Status(
      id : json['id'] as int,
      title : json['title'] as String,
    );
  }
}
