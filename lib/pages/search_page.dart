import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
  var cityName;

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
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                label: Text("Search"),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                border: OutlineInputBorder(),
                hintText: "Enter a City"),
            onSubmitted: (data)async{
              cityName=data;
             var service=WeatherService();
             WeatherModel weather=await service.getWeather(cityName: cityName);
             print(weather);

            },
          ),
        ),
      ),
    );
  }
}
