part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object?> get props => [];
}

final class SearchCityEvent extends CityEvent {
  
  final CityParamsModel params;

  const SearchCityEvent({required this.params});

  @override
  List<Object?> get props => [params];
}
final class TemperatureCityEvent extends CityEvent{

    TemperatureCityEvent({required this.temperature});

final TemperatureParamsModel temperature;



@override
  List<Object?> get props => [temperature];
}