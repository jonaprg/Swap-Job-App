import 'dart:ffi';

class Preference {
  late var id;
  late String title;
  late Float lowThreshold;
  late Float highThreshold;
  late Float value;

  Preference(
      this.id, this.title, this.lowThreshold, this.highThreshold, this.value);

  Preference.fromJson(Map<String, dynamic> json) {
    id = json['id'].parseLong();
    title = json['title'];
    lowThreshold = json['lowThreshold'].parseFloat();
    highThreshold = json['highThreshold'].parseFloat();
    value = json['value'].parseFloat();
  }
}
