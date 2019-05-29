import 'package:clima/services/networking.dart';
import 'package:clima/utilities/location.dart';

const apiKey = '28fe58141256bb844aaa61007c4733a4';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var openWeatherMapUrl2 = openWeatherMapUrl;
    var url = '$openWeatherMapUrl2?q=$cityName&appid=$apiKey&units=metric';
    print(url);
    var networkHelper = NetworkingHelper(url);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    var location = Location();
    await location.getLocation();

    var networkHelper = NetworkingHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
