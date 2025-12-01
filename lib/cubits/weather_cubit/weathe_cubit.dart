// cubits/weather_cubit/weathe_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/cubit_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatheCubit extends Cubit<CubitState>{
  WeatheCubit():super(weatherIntialState());
  WeatherModel? weatherModel;
  WeatherService weathearServices=WeatherService() ;
  void getWeather({required String cityName})async{
    emit(weatherLodaingState());
 try {
  weatherModel=await weathearServices.getWeather(cityName: cityName);
  emit(weatherSuccessState());
} on Exception catch (e) {
  emit(weatherFaluiergState());
  
}
  
  }
}