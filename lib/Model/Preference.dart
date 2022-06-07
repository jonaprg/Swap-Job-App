class Preference {
  final String title;
  final double lowThreshold;
  final double highThreshold;
  final double value;

  Preference( {
     required this.title,
     required this.lowThreshold,
     required this.highThreshold,
     required this.value
  });

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
    title : json['title'] as String,
    lowThreshold : json['lowThreshold'],
    highThreshold : json['highThreshold'],
    value : json['value'],
    );
  }
  Map<String, dynamic> toJson() => {
    'title' : title,
    'lowThreshold' : lowThreshold,
    'highThreshold' : highThreshold,
    'value' : value,
  };
}
