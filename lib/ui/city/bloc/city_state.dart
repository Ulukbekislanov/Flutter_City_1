part of 'city_bloc.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object?> get props => [];
}

final class CityInitial extends CityState {}

final class LoadingCitiesState extends CityState {}

final class LoadedCitiesState extends CityState {
  final List<CityModel> citiesList;

  const LoadedCitiesState({required this.citiesList});

  @override
  List<Object?> get props => [citiesList];
}

final class LoadedTemperatureState extends CityState{
    LoadedTemperatureState({required this.temperatureModels});
  final TemperatureModels temperatureModels;

  @override
  List<Object?> get props => [temperatureModels];


}


final class ErrorCitiesState extends CityState {}