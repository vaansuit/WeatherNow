import 'dart:convert';

import 'package:weather_app/models/current_weather_model.dart';
import 'package:http/http.dart' as http;
import '../models/location_model.dart';

class CurrentWeatherRepository {
  final String apiKey = '22b1b75301e54932a5b165859232604';

  Future<CurrentWeatherModel> getCurrentWeather(String location) async {
    final String url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseMap = jsonDecode(response.body);
      return responseMap.map<CurrentWeatherModel>(
          (resp) => CurrentWeatherModel.fromMap(resp).toString());
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
