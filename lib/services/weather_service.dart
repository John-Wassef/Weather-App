import 'dart:convert';
import 'package:http/http.dart' as http ;
class WeatherService
{
  var baseUrl="http://api.weatherapi.com/v1";
  var apiKey="2a5dd7154dc54be29f1193151230205";
void getWeather({required String cityName}) async{
  var url=Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
  http.Response response = await http.get(url);
  Map<String,dynamic> data=jsonDecode(response.body);
  print(data);
}
}