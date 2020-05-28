import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_model.dart';
import 'package:weather_icons/weather_icons.dart';

class Day extends StatelessWidget {
  Day(
      {@required this.maxTemp,
      @required this.minTemp,
      @required this.datetime,
      @required this.weatherCode});

  final int maxTemp;
  final int minTemp;
  final String datetime;
  final int weatherCode;

  IconData getWeatherIcon() {
    var time = 'day';

    switch (weatherCode) {
      case 200:
        return WeatherIcons.day_storm_showers; //Thunderstorm with light rain
      case 201:
        return WeatherIcons.day_storm_showers; //Thunderstorm with rain
      case 202:
        return WeatherIcons.day_thunderstorm; //Thunderstorm with heavy rain
      case 230:
        return WeatherIcons.day_lightning; //Thunderstorm with light drizzle
      case 231:
        return WeatherIcons.lightning; //Thunderstorm with light drizzle
      case 232:
        return WeatherIcons.lightning; //Thunderstorm with heavy drizzle
      case 233:
        return WeatherIcons.lightning; //Thunderstorm with Hail
      case 300:
        return WeatherIcons.day_showers; //Light Drizzle
      case 301:
        return WeatherIcons.day_showers; //Drizzle
      case 302:
        return WeatherIcons.day_showers; //Heavy Drizzle
      case 500:
        return WeatherIcons.day_rain; //Light Rain
      case 501:
        return WeatherIcons.day_rain; //Moderate Rain
      case 502:
        return WeatherIcons.rain; //Heavy Rain
      case 511:
        return WeatherIcons.rain; //Freezing rain
      case 520:
        return WeatherIcons.day_showers; //Light shower rain
      case 521:
        return WeatherIcons.day_showers; //Shower rain
      case 522:
        return WeatherIcons.showers; //Heavy shower rain
      case 600:
        return WeatherIcons.day_snow; //Light snow
      case 601:
        return WeatherIcons.snow; //Snow
      case 602:
        return WeatherIcons.snowflake_cold; //Heavy Snow
      case 610:
        return WeatherIcons.day_sleet; //Mix snow/rain
      case 611:
        return WeatherIcons.sleet; //Sleet
      case 612:
        return WeatherIcons.sleet; //Heavy sleet
      case 621:
        return WeatherIcons.day_sleet; //Snow shower
      case 622:
        return WeatherIcons.snowflake_cold; //Heavy snow shower
      case 623:
        return WeatherIcons.snow_wind; //Flurries
      case 700:
        return WeatherIcons.day_fog; //Mist
      case 711:
        return WeatherIcons.smog; //Smoke
      case 721:
        return WeatherIcons.day_fog; //Haze
      case 731:
        return WeatherIcons.dust; //Sand/dust
      case 741:
        return WeatherIcons.day_fog; //Fog
      case 751:
        return WeatherIcons.day_fog; //Freezing Fog
      case 800:
        return time == 'day'
            ? WeatherIcons.day_sunny
            : WeatherIcons.night_clear; //Clear sky
      case 801:
        return WeatherIcons.day_cloudy; //Few clouds
      case 802:
        return WeatherIcons.day_cloudy; //Scattered clouds
      case 803:
        return WeatherIcons.day_cloudy; //Broken clouds
      case 804:
        return WeatherIcons.cloudy; //Overcast clouds
      case 900:
        return WeatherIcons.na; //Unknown Precipitation
      default:
        return WeatherIcons.na; //icon code not found
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ThemeModel>(context, listen: false).toggleTheme();
      },
      child: Ink(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                datetime,
                style: TextStyle(fontSize: 24),
              ),
              Column(
                children: <Widget>[
                  Icon(
                    getWeatherIcon(),
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '${maxTemp.toString()}°',
                      style: TextStyle(fontSize: 24),
                    ),
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
