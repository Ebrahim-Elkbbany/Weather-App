import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/cubits/weather_cubit/weather_cubit.dart';



class SearchPage extends StatelessWidget {
   SearchPage();
  String ?cityName;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (data){cityName =data;},
            onSubmitted: (data) async{
              cityName = data;
             BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              Navigator.pop(context);
            },
             decoration:  InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('Search'),
              suffixIcon: GestureDetector(
                onTap: ()async{
                  BlocProvider.of<WeatherCubit>(context,listen: false).getWeather(cityName: cityName!);
                  Navigator.pop(context);
                },
                  child: Icon(Icons.search)
              ),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

