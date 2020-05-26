import 'package:flutter/material.dart';

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        children: <Widget>[
          Text(
            '25°',
            style: TextStyle(
              fontSize: 120,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              'Monday',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
