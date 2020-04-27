import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      var position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
