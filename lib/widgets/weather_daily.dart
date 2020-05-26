import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_day.dart';

class WeatherDaily extends StatelessWidget {
  WeatherDaily(this.weatherDaily);
  final weatherDaily;

  void test() {
    print(weatherDaily.data);
  }

  @override
  Widget build(BuildContext context) {
    test();
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 90),
      child: Column(children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: weatherDaily.weatherCount,
          itemBuilder: (context, i) {
            var weatherData = weatherDaily.data;
            int maxTemp = weatherData[i].maxTemp;
            int minTemp = weatherData[i].minTemp;
            String datetime = weatherData[i].datetime;
            return Day(maxTemp: maxTemp, minTemp: minTemp, datetime: datetime);
          },
        )
      ]),
    );
  }
}
