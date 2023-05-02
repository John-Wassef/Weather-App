class WeatherModel {
   String? date;
   double? avgTemp;
   double? minTemp;
   double? maxTemp;
   String? weatherCondition;

  WeatherModel(
      {required this.date,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition});

  WeatherModel.fromJson(dynamic data){
    var jsonData = data["forecast"]["forecastday"][0];
    date: data["location"]["localtime"];
    avgTemp: jsonData["avgtemp_c"];
    minTemp: jsonData["mintemp_c"];
    maxTemp: jsonData["maxtemp_c"];
    weatherCondition: jsonData["condition"]["text"];
  }
}
