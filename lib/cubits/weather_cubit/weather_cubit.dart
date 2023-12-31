
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel ?weatherModel;
  void getWeather({required String cityName})async{
    emit(WeatherLoading());
    try{
    weatherModel = await weatherService.getWeather(cityName: cityName) ;
    emit(WeatherSuccess());
    }catch(e){
      emit(WeatherFailure());
    }
  }

}
