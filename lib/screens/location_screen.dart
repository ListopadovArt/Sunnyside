import 'package:flutter/material.dart';
import 'package:sunnyside/utilities/constants.dart';
import 'package:sunnyside/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String cityName;
  late int temperature;
  late String message;
  late String icon;

  @override
  void initState() {
    super.initState();
    var weatherDate = widget.locationWeather; // Данные из экрана Loading
    updateUI(weatherDate);
  }

  void updateUI(dynamic weatherDate) {
    WeatherModel weather = WeatherModel();

    setState(() {
      cityName = weatherDate['name'];

      var condition = weatherDate['weather'][0]['id'];
      icon = weather.getWeatherIcon(condition);

      double temp = weatherDate['main']['temp'];
      temperature = temp.toInt();

      message = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temperature°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
