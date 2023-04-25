class LocationModel {
  final double latitude;
  final double longitude;
  final String? city;

  LocationModel({
    required this.latitude,
    required this.longitude,
    this.city,
  });
}
