part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory init() = _Init;
  const factory searchValueChanged(String value) = _SearchValueChanged;

  const factory fetchWeather() = _FetchWeather;
  const factory fetchWeatherSuccess(SearchWeatherModel? searchWeatherModel) =
      _FetchWeatherSuccess;
  const factory fetchWeatherFailed([String? errorMessage]) =
      _FetchWeatherFailed;

  const factory errorMessage([String? errorMessage]) = _ErrorMessage;
}
