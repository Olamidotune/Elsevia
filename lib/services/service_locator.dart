import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_travel/api/clients/destination_client.dart';
import 'package:go_travel/api/clients/weather_client.dart';
import 'package:go_travel/services/keys.dart';
import 'package:go_travel/services/logger.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  debugPrint('Open Meteo URL: ${EnvKeys.openMeteoBaseUrl}');
  // Dio
  final dio = Dio(
    BaseOptions(
      headers: baseHeaders,
      connectTimeout: const Duration(seconds: 30),
    ),
  );

  dio.interceptors.add(ResponseLoggingInterceptor());

  //HTTP Clients
  locator
    ..registerSingleton(
      WeatherClient(
        dio,
        baseUrl: const String.fromEnvironment(EnvKeys.openMeteoBaseUrl),
      ),
    )
    ..registerSingleton(
      DestinationClient(
        dio,
        baseUrl: const String.fromEnvironment(EnvKeys.wikimediaBaseUrl),
      ),
    );
}
