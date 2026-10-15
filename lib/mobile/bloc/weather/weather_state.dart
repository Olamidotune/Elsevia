part of 'weather_bloc.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory({
    String? errorMessage,
    SearchWeatherModel? searchWeatherModel,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus fetchSearchedWeatherStatus,
    @Default(SearchValue.pure()) SearchValue searchValue,
  }) = _WeatherState;
  const new _();
}
//==============================================================================
// New Password
//==============================================================================

class SearchValue extends FormzInput<String, ValidationError> {
  const new pure([super.value = '']) : super.pure();
  const new dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    return null;
  }
}
