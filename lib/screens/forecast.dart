import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_model.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/models/weather_today.dart';
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
    print('getWeather');
    await weather.getCityTodayWeather(searchValue);
    await weather.getCityDailyWeather(searchValue);
    updateUI();
    print(weatherToday.isDay());
    print(weather.weatherToday);
  }

  updateSearch(String newValue) {
    print('updateSearch');
    setState(() {
      searchValue = newValue;
      getWeather();
    });
  }

  void updateUI() {
    setState(() {
      weatherDaily.createWeatherDailyList(weather.weatherDaily['data']);
      weatherToday.updateWeather(weather.weatherToday['data']);
      isDay = weatherToday.isDay();
      print(weatherToday.isDay());
      print(weather.weatherDaily['data']);
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
                  Search(
                    value: searchValue,
                    updateSearch: updateSearch,
                  ),
                  SizedBox(
                    height: 150,
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
