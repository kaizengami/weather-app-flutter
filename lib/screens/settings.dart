import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/theme_model.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

enum Temperature { celcius, kelvin }

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  Temperature _temperature = Temperature.celcius;

  @override
  void initState() {
    darkMode = isDarkMode();
    super.initState();
  }

  bool isDarkMode() {
    final themeType =
        Provider.of<ThemeModel>(context, listen: false).getThemeType();

    return themeType == ThemeType.Dark ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), elevation: 0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Dark mode'),
                Switch(
                  value: isDarkMode(),
                  onChanged: (value) {
                    setState(() {
                      Provider.of<ThemeModel>(context, listen: false)
                          .toggleTheme();
                    });
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Display wind'),
                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Display humidity'),
                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            // ListTile(
            //   title: Text('Thomas Jefferson'),
            //   leading: Radio(
            //     value: Temperature.celcius,
            //     groupValue: _temperature,
            //     activeColor: Colors.white,
            //     focusColor: Colors.white,
            //     hoverColor: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
