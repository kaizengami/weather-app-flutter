import 'package:weather_app/services/http.dart';

const apiKey = 'cef87252b82546d283d1edb0feb1993b';
const dailyUrl = 'https://api.weatherbit.io/v2.0/forecast';
const todayUrl = 'https://api.weatherbit.io/v2.0';
// const apiKeyWeatherMap = 'e72ca729af228beabd5d20e3b7749713';
// const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';
//https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&%20exclude=hourly,daily&appid=7017f78bc15895dbac35a50f972c634a

class Weather {
  var weatherDaily;
  var weatherToday;

  Future<dynamic> getLocationWeather(
      {double latitude, double longitude}) async {
    Http networkHelper =
        Http('$dailyUrl?lat=$latitude&lon=$longitude&key=$apiKey');
    print(networkHelper.url);
    weatherDaily = await networkHelper.getData();
    return weatherDaily;
  }

  Future<dynamic> getCityDailyWeather(String cityName) async {
    Http networkHelper = Http('$dailyUrl/daily?city=$cityName&key=$apiKey');
    print(networkHelper.url);
    weatherDaily = await networkHelper.getData();
    return weatherDaily;
  }

  Future<dynamic> getCityTodayWeather(String cityName) async {
    Http networkHelper = Http('$todayUrl/current?city=$cityName&key=$apiKey');
    print(networkHelper.url);
    weatherToday = await networkHelper.getData();
    return weatherToday;
  }
}
