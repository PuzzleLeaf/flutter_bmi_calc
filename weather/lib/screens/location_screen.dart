import 'package:flutter/material.dart';
import 'package:flutter_weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Weather weather = new Weather();

  double temperature;
  int condition;
  String cityName;

  @override
  void initState() {
    setAnimation();
    updateUI(widget.locationWeather);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  void updateUI(dynamic weatherData) {
    _controller.reset();

    temperature = weatherData['main']['temp'] - 273;
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];

    animation = Tween<double>(begin: 0, end: temperature).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sunny.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        updateUI(await weather.getLocationWeather());
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Text(
                  weather.getWeatherIcon(condition),
                  style: TextStyle(
                    fontSize: 90.0,
                  ),
                ),
                Text(
                  '${animation.value.toInt()}°',
                  style: TextStyle(
                    fontSize: 80.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  cityName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
