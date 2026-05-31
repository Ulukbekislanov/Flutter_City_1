import 'package:flutter/material.dart';
import 'package:flutter_application_17/data/models/city_params_model.dart';
import 'package:flutter_application_17/ui/city/bloc/city_bloc.dart';
import 'package:flutter_application_17/ui/temperature/temperature_page.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});
  
  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {

  final CityBloc _cityBloc = CityBloc(); 
  
  @override
  void initState() {
    super.initState();
    
    _cityBloc.add(
      SearchCityEvent(
        params: CityParamsModel(searchText: 'Bishkek', format: 'json'),
      ),
    );
  }

  @override
  void dispose() {
    _cityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children :[
        TextField(
          onChanged: (value){
                _cityBloc.add(
      SearchCityEvent(
        params: CityParamsModel(searchText: value, format: 'json'),
      ),
    );
          }
        ),
      Expanded(  
        child: BlocBuilder<CityBloc, CityState>( 
          bloc: _cityBloc,
          builder: (context, state) {
            if (state is LoadedCitiesState) {
              return ListView.builder(
                itemCount: state.citiesList.length,
                itemBuilder: (context, index) {



                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TemperaturePage(
                        latitude: state.citiesList[index].lat,
                        longitude: state.citiesList[index].lon,
                      ),
                      )
                      );
                    },child: Column(
                    children: [
                      Text(
                        state.citiesList[index].name,
                        style: const TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.citiesList[index].displayName,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Divider(),  
                    ],
                  )
                  );
                  
                  
                },
              );
            }
            
            if (state is ErrorCitiesState) {
              return const Text(
                'Flutter 04', 
                style: TextStyle(fontSize: 50, color: Colors.red),
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      ]
    ),
    );
  }
}