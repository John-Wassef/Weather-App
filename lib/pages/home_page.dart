import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search),
            )
          ],
          title: const Text("Weather App"),
        ),
        body: ConditionalBuilder(
    condition: Provider.of<WeatherProvider>(context).weatherData == null ,
    builder: (context)=>  Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: const [
        Text(
          'there is no weather 😔 start',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'searching now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ]),
    )  ,
    fallback:(context)=> Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[300]!,
              weatherData!.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            "${Provider.of<WeatherProvider>(context).cityName}",
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at  ${weatherData!.date.hour}:${weatherData!.date.minute}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                "${weatherData!.avgTemp.toInt()}",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    "maxTemp: ${weatherData!.maxTemp.toInt()}",
                  ),
                  Text(
                    "minTemp: ${weatherData!.minTemp.toInt()}",
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
            weatherData!.weatherCondition,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    ) ,

    ),
      );
  }
}
