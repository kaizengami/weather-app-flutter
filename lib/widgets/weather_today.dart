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
        Text(
          temp,
          style: TextStyle(
            fontSize: 120,
            fontWeight: FontWeight.bold,
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
