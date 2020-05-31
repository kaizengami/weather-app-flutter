import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_day.dart';

class WeatherDaily extends StatelessWidget {
  WeatherDaily({this.weatherDaily, this.isDay});
  final weatherDaily;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 145),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: weatherDaily.weatherCount,
            itemBuilder: (context, i) {
              var weatherData = weatherDaily.data;
              int maxTemp = weatherData[i].maxTemp;
              int minTemp = weatherData[i].minTemp;
              int weatherCode = weatherData[i].weatherCode;
              return Container(
                key: Key(i.toString()),
                decoration: BoxDecoration(
                  // color: isDay ? Color(0xFF0a1949) : Colors.transparent,
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.black38),
                  ),
                ),
                child: Day(
                    maxTemp: maxTemp,
                    minTemp: minTemp,
                    datetime: weatherData[i].getDayName(),
                    weatherCode: weatherCode),
              );
            },
          )
        ]),
      ),
    );
  }
}
