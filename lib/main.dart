import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_travel/mobile/bloc/app_bloc_provider.dart';
import 'package:go_travel/router/app_router.dart';
import 'package:go_travel/services/service_locator.dart';

void main() async {
  runApp(const MyApp());

  await setUpLocator();
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.blocProviders,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        routerConfig: appRouter,
      ),
    );
  }
}
