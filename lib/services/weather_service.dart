import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  var baseUrl = "http://api.weatherapi.com/v1";
  var apiKey = "2a5dd7154dc54be29f1193151230205";

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      var url =
          Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (error) {
      print(error);
    }
    return weather;
  }
}
