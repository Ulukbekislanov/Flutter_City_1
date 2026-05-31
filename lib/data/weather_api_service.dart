import 'package:dio/dio.dart';
import 'package:flutter_application_17/data/models/city_model.dart';
import 'package:flutter_application_17/data/models/city_params_model.dart';
import 'package:flutter_application_17/data/models/temperature_params_model.dart';
import 'package:flutter_application_17/data/models/temperature_models.dart';

import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class WeatherApiService {
  final Dio _dio = Dio();

  WeatherApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  /// Получение списка городов по параметрам
  Future<List<CityModel>> getCities(CityParamsModel params) async {
    final Response response = await _dio.get(
      'https://nominatim.openstreetmap.org/search',
      queryParameters: params.toJson(),
      options: Options(headers: {"User-Agent": "weather_app"}), // Исправил опечатку в "weather_app"
    );
    
    List<CityModel> cities = [];

    if (response.data is List) {
      final List dataList = response.data as List;

      for (var city in dataList) {
        cities.add(CityModel.fromJson(city));
      }
    }

    return cities;
  }

  /// Получение прогноза температуры по параметрам
  Future<TemperatureModels> getTemperature(TemperatureParamsModel params) async {
    final Response response = await _dio.get(
      'https://api.open-meteo.com/v1/forecast',
      queryParameters: params.toJson(),
    );
    
    final TemperatureModels temperatureModels = TemperatureModels.fromJson(response.data);
    return temperatureModels;
  }
}