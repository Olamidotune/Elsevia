import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_travel/api/clients/weather_client.dart';
import 'package:go_travel/api/models/weather/weather_model.dart';
import 'package:go_travel/enums/validation_error.dart';
import 'package:go_travel/services/logging_helper.dart';
import 'package:go_travel/services/service_locator.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  new() : super(const WeatherState()) {
    on<_FetchWeather>(_fetchWeather);
    on<_FetchWeatherSuccess>(_fetchWeatherSuccess);
    on<_FetchWeatherFailed>(_fetchWeatherFailed);
    on<_SearchValueChanged>(_searchValueChanged);
    on<_Init>(_int);

    add(_Init());
  }

  void _int(_Init event, Emitter<WeatherState> emit) {
    // add(const _FetchWeather());
  }

  void _fetchWeather(_FetchWeather event, Emitter<WeatherState> emit) async {
    if (state.fetchSearchedWeatherStatus.isInProgress) {
      return;
    }

    emit(
      state.copyWith(
        fetchSearchedWeatherStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    try {
      final result = await locator<WeatherClient>().getCityWeather(
        state.getCityWeatherString ?? '',
      );

      add(_FetchWeatherSuccess(result));
    } catch (error, trace) {
      logError(error, trace);

      add(const _FetchWeatherFailed());
    }
  }

  void _fetchWeatherSuccess(
    _FetchWeatherSuccess event,
    Emitter<WeatherState> emit,
  ) {
    emit(
      state.copyWith(
        fetchSearchedWeatherStatus: FormzSubmissionStatus.success,
        searchWeatherModel: event.searchWeatherModel,
        errorMessage: null,
      ),
    );
  }

  void _fetchWeatherFailed(
    _FetchWeatherFailed event,
    Emitter<WeatherState> emit,
  ) {
    emit(
      state.copyWith(
        fetchSearchedWeatherStatus: FormzSubmissionStatus.failure,

        errorMessage: event.errorMessage,
      ),
    );
  }

  void _searchValueChanged(
    _SearchValueChanged event,
    Emitter<WeatherState> emit,
  ) {
    emit(state.copyWith(getCityWeatherString: event.value));
  }
}
