import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherCondition;
  String weatherIcon;
  String name;

  WeatherModel({
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.weatherIcon,
    required this.name,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data ) {
    var tempData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        name:data['location']['name'] ,
        date: DateTime.parse( data['current']['last_updated']),
        avgTemp: tempData['avgtemp_c'],
        maxTemp: tempData['maxtemp_c'],
        minTemp: tempData['mintemp_c'],
        weatherCondition: tempData['condition']['text'],
        weatherIcon: tempData['condition']['icon']);
  }


  MaterialColor getThemeColor(){
    if (weatherCondition == 'Sunny'|| weatherCondition =='Clear' ||weatherCondition =='partly cloudy'){
      return Colors.orange;
    }else if(weatherCondition =='Blizzard'|| weatherCondition =='Patchy snow possible' ||weatherCondition =='Patchy sleet possible'||weatherCondition == 'Patchy freezing drizzle possible' ||weatherCondition == 'Blowing snow'){
      return Colors.blue;
    } else if (weatherCondition == 'Freezing fog' || weatherCondition == 'Fog' ||  weatherCondition == 'Heavy Cloud' || weatherCondition == 'Mist' || weatherCondition == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers	') {
      return Colors.blue;
    } else if (weatherCondition== 'Thundery outbreaks possible' || weatherCondition== 'Moderate or heavy snow with thunder' || weatherCondition == 'Patchy light snow with thunder'|| weatherCondition == 'Moderate or heavy rain with thunder' || weatherCondition == 'Patchy light rain with thunder' || weatherCondition == 'Moderate rain') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }


}
}
