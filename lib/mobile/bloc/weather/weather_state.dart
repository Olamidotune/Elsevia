part of 'weather_bloc.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory({
    String? errorMessage,
    SearchWeatherModel? searchWeatherModel,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus fetchSearchedWeatherStatus,
    @Default(SearchValue.pure()) SearchValue searchValue,
    String? searchCityString,
  }) = _WeatherState;

  const new _();

  List<Result> get cryptoAssetSearchResult {
    final query = searchCityString?.trim().toLowerCase() ?? '';

    if (query.isEmpty) return [];

    return searchWeatherModel?.results
            ?.where(
              (city) => city.name?.toLowerCase().startsWith(query) ?? false,
            )
            .toList() ??
        [];
  }

  List<Result> get computedCities {
    final query = searchCityString?.trim() ?? '';

    if (query.isEmpty) {
      return searchWeatherModel?.results?.toList() ?? [];
    }

    return cryptoAssetSearchResult;
  }
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
