import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../models/location_model.dart';

class LocationRepository {
  Future<LocationModel?> getCurrentLocation() async {
    bool isServiceEnabled;
    LocationPermission userLocationPermition;
    Position userPosition;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return null;
    }

    userLocationPermition = await Geolocator.checkPermission();
    if (userLocationPermition == LocationPermission.denied) {
      userLocationPermition = await Geolocator.requestPermission();
      if (userLocationPermition == LocationPermission.denied) {
        return null;
      }
    }
    if (userLocationPermition == LocationPermission.deniedForever) {
      return null;
    }

    try {
      userPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final placemarks = await placemarkFromCoordinates(
          userPosition.latitude, userPosition.longitude);
      final address = placemarks.first.subAdministrativeArea ?? 'Unknown';
      return LocationModel(
        city: address,
      );
    } catch (e) {
      return null;
    }
  }
}
