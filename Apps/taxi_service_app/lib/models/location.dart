import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CurrentLocation {
  static late LocationData _currentPosition;
  static Location location = Location();

  // CurrentLocation(this.location);

  static Future<LatLng> getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {}
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {}
    }

    _currentPosition = await location.getLocation();
    return LatLng(
        _currentPosition.latitude ?? 10, _currentPosition.longitude ?? 10);
  }
}
