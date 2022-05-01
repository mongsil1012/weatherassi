import 'package:geolocator/geolocator.dart';

class MyLocation{

  double latitude = 0;
  double longitude = 0;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print('There was a problem with getting location.');
    }
  }
}

