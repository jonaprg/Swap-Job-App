
class Preference {
  final int id;
  final String title;
  final double lowThreshold;
  final double highThreshold;
  final double value;

  const Preference( {
     required this.id,
     required this.title,
     required this.lowThreshold,
     required this.highThreshold,
     required this.value
  });
     
  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
    id : json['id'] as int,
    title : json['title'] as String,
    lowThreshold : json['lowThreshold'],
    highThreshold : json['highThreshold'],
    value : json['value'],
    );
  }
}
