import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_day.dart';

class WeatherDailyModel extends ChangeNotifier {
  List<WeatherDay> _weatherData = [];

  List<WeatherDay> get data {
    return _weatherData;
  }

  int get weatherCount => _weatherData.length;

  void createWeatherDailyList(var weatherData) {
    for (var day in weatherData) {
      final newWeatherDay = WeatherDay(
          maxTemp: day['max_temp'].toInt(),
          minTemp: day['min_temp'].toInt(),
          datetime: day['datetime']);
      print(newWeatherDay.datetime);
      print(newWeatherDay.maxTemp);
      _weatherData.add(newWeatherDay);
    }

    notifyListeners();
  }
}
