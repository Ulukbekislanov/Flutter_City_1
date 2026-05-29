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