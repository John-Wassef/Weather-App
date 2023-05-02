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
}
