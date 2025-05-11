import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/cubits/weather_cubit/weather_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),

      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is WeatherSuccess) {
            return Center(child: Text('Temperature: ${state.temperature}°C'));
          }
          if (state is WeatherFailure) {
            return Center(child: Text('Error loading weather data'));
          }
          return Center(child: Text('No data, start searching now!'));
        },
      ),
    );
  }
}
