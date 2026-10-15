import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_travel/constants/app_spacing.dart';
import 'package:go_travel/mobile/bloc/weather/weather_bloc.dart';
import 'package:go_travel/widgets/app_search_bar.dart';

class MobileHome extends StatelessWidget {
  const new({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Current Location'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(padding: EdgeInsets.all(10), child: AppSearchBar()),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.fetchSearchedWeatherStatus.isInProgress &&
              state.computedCities.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.fetchSearchedWeatherStatus.isFailure) {
            return const Center(child: Text('Failed'));
          }
          if (state.computedCities.isEmpty) {
            return const Center(child: Text('No Data'));
          }
          return Padding(
            padding: EdgeInsetsGeometry.all(AppSpacing.verticalValueMedium),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final city = state.computedCities[index];
                return Center(child: Text(city.name ?? 'N/A'));
              },
              separatorBuilder: (context, index) {
                return AppSpacing.verticalSpaceMedium;
              },
              itemCount: state.computedCities.length,
            ),
          );
        },
      ),
    );
  }
}
