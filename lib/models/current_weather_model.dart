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
    return CurrentWeatherModel(
        location: json[''],
        temperature: json[''],
        weatherCondition: json[''],
        latitude: json[''],
        longitude: json['']);
  }
}
