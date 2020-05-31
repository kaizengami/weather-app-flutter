import 'package:flutter/material.dart';

class WeatherToday extends StatelessWidget {
  WeatherToday(this.weatherToday);
  final weatherToday;

  @override
  Widget build(BuildContext context) {
    String temp =
        weatherToday.temp != null ? weatherToday.temp.toString() : '-';
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            '$temp°',
            style: TextStyle(
              fontSize: 120,
              fontWeight: FontWeight.bold,
              height: 0.60,
            ),
          ),
        ),
        Text(
          weatherToday.getDayName(),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
