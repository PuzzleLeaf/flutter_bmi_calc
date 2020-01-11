import 'package:flutter/material.dart';
import 'package:flutter_weather/services/location.dart';
import 'package:flutter_weather/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation () async {
    Location location = new Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = new NetworkHelper('https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b6907d289e10d714a6e88b30761fae22');
    var data = await networkHelper.getData();

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
