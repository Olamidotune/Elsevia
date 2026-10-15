import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class SearchWeatherModel {
  new({this.results, this.generationtimeMs});

  factory fromJson(Map<String, dynamic> json) =>
      _$SearchWeatherModelFromJson(json);
  @JsonKey(name: 'results')
  List<Result>? results;
  @JsonKey(name: 'generationtime_ms')
  double? generationtimeMs;

  Map<String, dynamic> toJson() => _$SearchWeatherModelToJson(this);
}

@JsonSerializable()
class Result {
  new({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.admin2Id,
    this.timezone,
    this.population,
    this.countryId,
    this.country,
    this.admin1,
    this.admin2,
  });

  factory fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;
  @JsonKey(name: 'elevation')
  int? elevation;
  @JsonKey(name: 'feature_code')
  String? featureCode;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'admin1_id')
  int? admin1Id;
  @JsonKey(name: 'admin2_id')
  int? admin2Id;
  @JsonKey(name: 'timezone')
  String? timezone;
  @JsonKey(name: 'population')
  int? population;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'admin1')
  String? admin1;
  @JsonKey(name: 'admin2')
  String? admin2;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
