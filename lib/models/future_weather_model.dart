class FutureWeatherModel {
  String location;
  String date;
  String icon;
  double temperature;

  FutureWeatherModel({
    required this.location,
    required this.date,
    required this.icon,
    required this.temperature,
  });

  factory FutureWeatherModel.fromJson(Map<String, dynamic> json) {
    return FutureWeatherModel(
      location: json[''],
      date: json[''],
      icon: json[''],
      temperature: json[''],
    );
  }
}
