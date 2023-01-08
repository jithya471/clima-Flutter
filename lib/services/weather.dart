import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '470f73a9f2734b5d0cce620c5e05c6c8';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    Networking networking =
        Networking('$openWeatherMap?q=$cityName&appid=$apiKey&units=metric');
        var weatherData =await networking.getData();
        return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrectLocation();

    Networking networking = Networking(
        '$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    // print(latitude);
    // print(longitude);
    var weatherData = await networking.getData();
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
