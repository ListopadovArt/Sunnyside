import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude = 0.0;
  late double longitude = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      print("geolocator: $error");
    }
    ;
  }
}
