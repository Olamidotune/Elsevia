import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_travel/api/clients/weather_client.dart';
import 'package:go_travel/api/models/weather/weather_model.dart';
import 'package:go_travel/services/service_locator.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  new() : super(const WeatherState()) {
    on<_FetchWeather>(_fetchWeather);

    on<_Init>(_int);

    add(_Init());
  }

  void _int(_Init event, Emitter<WeatherState> emit) {
    add(_FetchWeather("cityName"));
  }

  void _fetchWeather(_FetchWeather event, Emitter<WeatherState> emit) async {
    await locator<WeatherClient>().getCityWeather('Lagos');
  }
}
