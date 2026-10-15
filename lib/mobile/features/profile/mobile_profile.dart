import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_travel/mobile/bloc/bloc/weather_bloc.dart';

class MobileProfile extends StatelessWidget {
  const new({super.key});

  static const String routeName = '/mobile_profile';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () => context.read<WeatherBloc>().add(
                const WeatherEvent.fetchWeather("Lagos"),
              ),
              child: Text('data'),
            ),
          ),
        );
      },
    );
  }
}
