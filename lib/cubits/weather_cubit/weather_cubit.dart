import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeather() async {
    emit(WeatherLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(WeatherSuccess(temperature: 25.0));
    } catch (_) {
      emit(WeatherFailure());
    }
  }
}
