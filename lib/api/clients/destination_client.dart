import 'package:dio/dio.dart';
import 'package:go_travel/api/models/destination_summary.dart';
import 'package:retrofit/retrofit.dart';

part 'destination_client.g.dart';

@RestApi()
abstract class DestinationClient {
  factory(Dio dio, {String? baseUrl}) = _DestinationClient;

  @GET('/v1/search')
  Future<DestinationSummary> getSummary(
    @Query('name') String cityName, {
    @Query('limit') int count = 10,
  });
}
