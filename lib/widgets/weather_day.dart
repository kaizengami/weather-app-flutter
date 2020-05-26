import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_model.dart';

class Day extends StatelessWidget {
  Day(
      {@required this.maxTemp,
      @required this.minTemp,
      @required this.datetime});

  final int maxTemp;
  final int minTemp;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ThemeModel>(context, listen: false).toggleTheme();
      },
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                datetime,
                style: TextStyle(fontSize: 24),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'T',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    maxTemp.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
