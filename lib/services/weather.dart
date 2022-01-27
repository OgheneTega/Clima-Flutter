import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '35d2a1d487c221b5959140b6f1ddf3fa';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String typedName) async {
    var url = '$openWeatherMapURL?q=$typedName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = url != null ? NetworkHelper(url) : "";
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLoctionWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = url != null ? NetworkHelper(url) : "";

    var weatherData = await networkHelper.getData();
    return weatherData;
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
