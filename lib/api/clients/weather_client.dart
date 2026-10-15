import 'package:dio/dio.dart';
import 'package:go_travel/api/models/weather/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_client.g.dart';

@RestApi()
abstract class WeatherClient {
  factory(Dio dio, {String? baseUrl}) = _WeatherClient;

  @GET('/v1/search')
  Future<SearchWeatherModel> getCityWeather(
    @Query('name') String cityName, {

    @Query('count') int count = 10,
    @Query('language') String language = 'en',
    @Query('format') String format = 'json',
  });
}
