import 'package:flutter_weather/services/location.dart';
import 'package:flutter_weather/services/network_helper.dart';

class Weather {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☂';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '❄';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🎈';
    }
  }

  dynamic getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=b6907d289e10d714a6e88b30761fae22');
    return await networkHelper.getData();

  }
}
