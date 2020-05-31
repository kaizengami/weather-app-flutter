import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_model.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/models/weather_today.dart';
import 'package:weather_app/screens/settings.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/widgets/search.dart';
import 'package:weather_app/widgets/weather_daily.dart';
import 'package:weather_app/widgets/weather_today.dart';

const apiKey = '7017f78bc15895dbac35a50f972c634a';

class ForecastScreen extends StatefulWidget {
  static const String id = 'forecast_screen';

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  Location location = Location();
  Weather weather = Weather();
  WeatherDailyModel weatherDaily = WeatherDailyModel();
  WeatherTodayModel weatherToday = WeatherTodayModel();
  String searchValue = 'Bila Tserkva';
  bool isDay = true;

  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    await weather.getCityTodayWeather(searchValue);
    await weather.getCityDailyWeather(searchValue);
    updateUI();
  }

  updateSearch(String newValue) {
    setState(() {
      searchValue = newValue;
      getWeather();
    });
  }

  void updateUI() {
    setState(() {
      weatherDaily.createWeatherDailyList(weather.weatherDaily['data']);
      weatherToday.updateWeather(weather.weatherToday['data']);
      searchValue = weatherToday.cityName;
      isDay = weatherToday.isDay();
    });
  }

  AssetImage getBackgroundImage() {
    final themeType =
        Provider.of<ThemeModel>(context, listen: false).getThemeType();
    switch (themeType) {
      case ThemeType.Light:
        return isDay
            ? AssetImage("images/bg-day-mobile.png")
            : AssetImage("images/bg-night-mobile.png");
      case ThemeType.Dark:
        return AssetImage("images/solid_black.png");
      default:
        return AssetImage("images/solid_black.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: getBackgroundImage(),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Search(
                              value: searchValue,
                              updateSearch: updateSearch,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SettingsScreen.id,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 210,
                  ),
                  WeatherToday(weatherToday),
                ],
              ),
            ),
            WeatherDaily(
              weatherDaily: weatherDaily,
              isDay: weatherToday.isDay(),
            )
          ],
        ),
      ),
    );
  }
}
