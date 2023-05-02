class WeatherModel {
  final String date;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.date,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0];

    return WeatherModel(
        date: data["location"]["localtime"],
        avgTemp: jsonData["avgtemp_c"],
        minTemp: jsonData["mintemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        weatherCondition: jsonData["condition"]["text"]);
  }
}
