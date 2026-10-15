part of 'weather_bloc.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory({
    String? errorMessage,
    SearchWeatherModel? searchWeatherModel,
    @Default(false) bool initialized,
    @Default(FormzSubmissionStatus.initial)
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus fetchProfileStatus,
  }) = _WeatherState;
  const new _();
}
