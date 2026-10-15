import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_travel/mobile/bloc/weather/weather_bloc.dart';

class AppBlocProvider {
  static List<BlocProvider> get blocProviders => [
    BlocProvider<WeatherBloc>(create: (context) => WeatherBloc()),
  ];
}
