part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.init() = _Init;
  const factory WeatherEvent.fetchWeather(String cityName) = _FetchWeather;
}
