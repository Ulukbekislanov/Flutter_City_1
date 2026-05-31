class TemperatureParamsModel {
    TemperatureParamsModel({required this.latitude, required this.longitude}); 
  final String latitude; 
  final String longitude;

Map<String,dynamic> toJson() => {
  'latitude': latitude,
  'longitude': longitude,
  'current_weather': true,
};
}