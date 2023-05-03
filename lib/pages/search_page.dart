import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  var cityName;
  VoidCallback? updateUi;

  SearchPage({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              var service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                suffix: GestureDetector(
                  child: Icon(Icons.search),
                  onTap: ()async {
                    var service = WeatherService();
                    WeatherModel weather =
                    await service.getWeather(cityName: cityName);
                    Provider.of<WeatherProvider>(context, listen: false).weatherData =
                        weather;
                    Provider.of<WeatherProvider>(context, listen: false).cityName =
                        cityName;
                    Navigator.pop(context);
                  },
                ),
                label: Text("Search"),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                border: OutlineInputBorder(),
                hintText: "Enter a City"),
          ),
        ),
      ),
    );
  }
}
