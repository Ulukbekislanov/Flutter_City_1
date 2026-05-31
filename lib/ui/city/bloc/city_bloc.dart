import 'dart:developer'
    as developer; 
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_17/data/models/city_params_model.dart';
import 'package:flutter_application_17/data/models/temperature_models.dart';
import 'package:flutter_application_17/data/models/temperature_params_model.dart';
import 'package:flutter_application_17/data/weather_api_service.dart';
import 'package:flutter_application_17/data/models/city_model.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final WeatherApiService apiService = WeatherApiService();

  CityBloc() : super(CityInitial()) {
    on<SearchCityEvent>((event, emit) async {
      try {
        emit(LoadingCitiesState());

        final listCities = await apiService.getCities(event.params);

        emit(LoadedCitiesState(citiesList: listCities));
      } catch (error, stackTrace) {
        developer.log(
          'Ошибка в CityBloc при поиске городов',
          error: error,
          stackTrace: stackTrace,
        );

        emit(ErrorCitiesState());
      }
    });
    on<TemperatureCityEvent>((event,emit)async{
      try{
        emit(LoadingCitiesState());
      final TemperatureModels temperature = await apiService.getTemperature(event.temperature);
      emit(LoadedTemperatureState(temperatureModels: temperature));
      }catch(error, stackTrace){
        emit(ErrorCitiesState());
      }
    });
  }
}
