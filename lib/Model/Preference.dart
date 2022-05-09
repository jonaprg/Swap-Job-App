
class Preference {
  late var id;
  late String title;
  late var lowThreshold;
  late var highThreshold;
  late var value;

  Preference(
      this.id, this.title, this.lowThreshold, this.highThreshold, this.value);

  Preference.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    lowThreshold = json['lowThreshold'];
    highThreshold = json['highThreshold'];
    value = json['value'];
  }
}
