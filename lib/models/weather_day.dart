import 'package:intl/intl.dart';

class WeatherDay {
  WeatherDay({this.maxTemp, this.minTemp, this.datetime, this.weatherCode});
  final int maxTemp;
  final int minTemp;
  final String datetime;
  final int weatherCode;

  String getDayName() {
    var parsedDate = DateTime.parse(datetime);
    print(parsedDate);
    print(DateFormat('EEEE').format(parsedDate));
    return DateFormat('EEEE').format(parsedDate);
  }
}
