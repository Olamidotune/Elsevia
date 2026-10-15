import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_travel/services/keys.dart';
import 'package:go_travel/services/logger.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  final dio = Dio(BaseOptions(headers: baseHeaders));

  if (kDebugMode) {
    dio.interceptors.add(ResponseLoggingInterceptor());
    // locator..registerFactory();
  }
}
