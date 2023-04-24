import 'package:geolocator/geolocator.dart';

class LocationModel {
  Position? position;
  String? city;

  LocationModel({
    this.position,
    this.city,
  });

  factory LocationModel.fromPosition(Position position, String city) {
    return LocationModel(
      position: position,
      city: city,
    );
  }
}
