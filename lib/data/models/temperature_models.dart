class TemperatureModels {
  TemperatureModels({
    required this.latitude, 
    required this.longitude,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });
  final double latitude;
  final double longitude;
  final String currentWeatherUnits;
  final double currentWeather;

factory TemperatureModels.fromJson(Map <String,dynamic> json){
  return TemperatureModels(
    latitude: json['latitude'],
    longitude: json['longitude'],
    currentWeatherUnits: json['current_weather_units'] ['temperature'],
    currentWeather: json['current_weather'] ['temperature'],
  );
}
}
