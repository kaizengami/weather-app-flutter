import 'package:intl/intl.dart';

class WeatherTodayModel {
  WeatherTodayModel(
      {this.temp,
      this.weatherCode,
      this.timezone,
      this.datetime,
      this.sunrise,
      this.sunset,
      this.partOfTheDay});
  int temp = 0;
  String weatherCode;
  String timezone;
  String datetime;
  String sunrise;
  String sunset;
  String partOfTheDay;

  String getDayName() {
    if (datetime == null) {
      var now = new DateTime.now();

      return DateFormat('EEEE').format(now);
    } else {
      String weatherDate = datetime.substring(0, datetime.indexOf(':'));
      var parsedDate = DateTime.parse(weatherDate);

      return DateFormat('EEEE').format(parsedDate);
    }
  }

  bool isDay() {
    print(partOfTheDay);
    return partOfTheDay == 'd' ? true : false;
  }

  void updateWeather(weatherData) {
    this.temp = weatherData[0]['temp'].toInt();
    this.weatherCode = weatherData[0]['weather']['code'];
    this.timezone = weatherData[0]['timezone'];
    this.datetime = weatherData[0]['datetime'];
    this.sunrise = weatherData[0]['sunrise'];
    this.sunset = weatherData[0]['sunset'];
    this.partOfTheDay = weatherData[0]['pod'];
  }
}
