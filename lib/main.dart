import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:weather_icons/weather_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperTwo(reverse: false),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.75,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      image: DecorationImage(
                          image: AssetImage('assets/clear.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        'Clear',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '23°',
                        style: TextStyle(fontSize: 80),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'DHAKA',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  WeatherSmall(
                    text: 'Now',
                    icon: WeatherIcons.night_clear,
                  ),
                  WeatherSmall(
                    text: '20',
                    icon: WeatherIcons.night_clear,
                  ),
                  WeatherSmall(
                    text: '21',
                    icon: WeatherIcons.cloud,
                  ),
                  WeatherSmall(
                    text: '22',
                    icon: WeatherIcons.cloudy_windy,
                  ),
                  WeatherSmall(
                    text: '23',
                    icon: WeatherIcons.night_cloudy_gusts,
                  ),
                  WeatherSmall(
                    text: '00',
                    icon: WeatherIcons.cloudy_windy,
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  TabBar(
                    tabs: [
                      Tab(text: 'Today'),
                      Tab(text: 'Tomorrow'),
                    ],
                  ),
                  Container(
                    height: 350,
                    child: TabBarView(children: [
                      TabbarPageView(),
                      TabbarPageView(),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabbarPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RowOfDayWeather(
          day: 'Friday',
          temp: '4, -2',
          icon: WeatherIcons.day_thunderstorm,
        ),
        RowOfDayWeather(
          day: 'Saturday',
          temp: '6, -4',
          icon: WeatherIcons.day_windy,
        ),
        RowOfDayWeather(
          day: 'Sunday',
          temp: '2, -7',
          icon: WeatherIcons.day_showers,
        ),
        RowOfDayWeather(
          day: 'Monday',
          temp: '5, -1',
          icon: WeatherIcons.day_showers,
        ),
        RowOfDayWeather(
          day: 'Tuesday',
          temp: '12, -3',
          icon: WeatherIcons.day_sleet_storm,
        ),
        RowOfDayWeather(
          day: 'Wednesday',
          temp: '9, -4',
          icon: WeatherIcons.day_snow,
        ),
        RowOfDayWeather(
          day: 'Thursday',
          temp: '5, -3',
          icon: WeatherIcons.day_snow_wind,
        ),
      ],
    );
  }
}

class RowOfDayWeather extends StatelessWidget {
  final String day;
  final String temp;
  final IconData icon;
  RowOfDayWeather({this.icon, this.day, this.temp});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(day),
        BoxedIcon(icon),
        Text(temp),
      ],
    );
  }
}

class WeatherSmall extends StatelessWidget {
  final String text;
  final IconData icon;
  WeatherSmall({this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 60,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          BoxedIcon(icon),
        ],
      ),
    );
  }
}
