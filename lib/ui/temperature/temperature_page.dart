import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_17/data/models/temperature_params_model.dart';
import 'package:flutter_application_17/ui/city/bloc/city_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage ({super.key,required this.latitude, required this.longitude});

  final  String latitude;
  final  String longitude;
  
  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}
class _TemperaturePageState extends State<TemperaturePage>{
  final CityBloc _cityBloc = CityBloc();
  
@override
  void initState() {
    _cityBloc.add(TemperatureCityEvent(temperature: TemperatureParamsModel(
      latitude: widget.latitude,
      longitude: widget.longitude
      )));
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
body: Center(
  child: BlocBuilder <CityBloc, CityState>(
    bloc: _cityBloc,
    builder: (context,state) {
if (state is LoadedTemperatureState){
  return Text(
        '${state.temperatureModels.currentWeather}'
    '${state.temperatureModels.currentWeatherUnits}',

  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
  );
}
if (state is ErrorCitiesState){
  return Text('FLUTTER04',style: TextStyle(fontSize: 50, color: Colors.red),);
}
return CircularProgressIndicator();
    }
  )
),
  );
  }
}