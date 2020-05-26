import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/forecast.dart';
import 'package:weather_app/screens/settings.dart';
import 'models/theme_model.dart';

void main() => runApp(ChangeNotifierProvider<ThemeModel>(
    create: (BuildContext context) => ThemeModel(), child: Weather()));

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeModel>(context).currentTheme,
      initialRoute: ForecastScreen.id,
      routes: {
        ForecastScreen.id: (context) => ForecastScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
