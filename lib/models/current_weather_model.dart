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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'location': location});
    result.addAll({'temperature': temperature});
    result.addAll({'weatherCondition': weatherCondition});
    result.addAll({'latitude': latitude});
    result.addAll({'longitude': longitude});

    return result;
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      location: map['location'] ?? '',
      temperature: map['temperature']?.toDouble() ?? 0.0,
      weatherCondition: map['weatherCondition'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) =>
      CurrentWeatherModel.fromMap(json.decode(source));
}
