import 'package:flutter/material.dart';
import 'package:weatherassi/data/my_location.dart';
import 'package:weatherassi/data/network.dart';
import 'package:weatherassi/screens/main_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '2eda198ceb291584d5d530991d72ac71';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double lat = 0;
  double long = 0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    lat = myLocation.latitude;
    long = myLocation.longitude;

    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'lat':lat.toString(),'lon':long.toString(), 'appid':apikey, 'units':'metric'});
    Uri url2 = Uri.https('api.openweathermap.org', '/data/2.5/air_pollution',
        {'lat':lat.toString(),'lon':long.toString(), 'appid':apikey, 'units':'metric'});
    Network network = Network(url,url2);
    var weatherData = await network.getJsonData();
    var airData = await network.getAirData();

    Navigator.push(context,MaterialPageRoute(builder: (context){
      return MainScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: SpinKitThreeBounce(
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}