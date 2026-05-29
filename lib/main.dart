import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_17/data/weather_api_service.dart';
import 'package:flutter_application_17/ui/city/city_page.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';




void main() async{
  Bloc.observer = TalkerBlocObserver();
  runApp(MaterialApp(home: CityPage()));
}
