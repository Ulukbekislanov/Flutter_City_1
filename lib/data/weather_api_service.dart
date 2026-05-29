import 'package:dio/dio.dart';
import 'package:flutter_application_17/data/models/city_model.dart';
import 'package:flutter_application_17/data/models/city_params_model.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class WeatherApiService {
  final Dio _dio = Dio();

  WeatherApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<List<CityModel>> getCities(CityParamsModel params) async {
    final Response response = await _dio.get(
      'https://nominatim.openstreetmap.org/search',
      queryParameters: params.toJson(),
      options: Options(headers: {"User-Agent": "waether_app"}),
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
}
