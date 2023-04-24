import 'dart:convert';

class CurrentWeatherModel {
  String location;
  double temperature;
  String weatherCondition;
  double latitude;
  double longitude;

  CurrentWeatherModel({
    required this.location,
    required this.temperature,
    required this.weatherCondition,
    required this.latitude,
    required this.longitude,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'];
    final current = json['current'];

    return CurrentWeatherModel(
      location: location['name'],
      temperature: current['temp_c'],
      weatherCondition: current['condition']['text'],
      latitude: location['lat'],
      longitude: location['long'],
    );
  }
}
