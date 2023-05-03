import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi(){
    setState(() {

    });
  }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage(updateUi: updateUi,)));
              },
              icon: Icon(Icons.search),
            )
          ],
          title: Text("Weather App"),
        ),
        body: Provider.of<WeatherProvider>(context).weatherData  == null
            ? Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
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
              )
            : Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
              [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,

              ],
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter ,
            )
          ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      "${Provider.of<WeatherProvider>(context).cityName}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "updated at ${weatherData!.date.hour}:${weatherData!.date.minute}",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          "${weatherData!.avgTemp.toInt()}",
                          style: TextStyle(
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
                    Spacer(),
                    Text(
                      "${weatherData!.weatherCondition}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    )
                  ],
                ),
              ));
  }
}
