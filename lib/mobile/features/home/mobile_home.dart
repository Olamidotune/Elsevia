import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_travel/constants/app_colors.dart';
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
            return Padding(
              padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const BestPlaces();
                      },
                      itemCount: 20,
                      separatorBuilder: (context, index) {
                        return AppSpacing.horizontalSpaceMedium;
                      },
                    ),
                  ),
                  AppSpacing.verticalSpaceMedium,
                  const Text('Popular Destinations'),
                ],
              ),
            );
          }
          return Padding(
            padding: EdgeInsetsGeometry.all(AppSpacing.verticalValueMedium),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final city = state.computedCities[index];
                return Material(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(AppSpacing.horizontalSpacingSmall),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: SvgPicture.asset(
                            'assets/svg/city.svg',
                            height: 30,
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        Expanded(
                          child: Text(
                            "${city.name ?? 'N/A'},${city.admin1 ?? 'N/A'}. ${city.country ?? "N/A"} ",
                          ),
                        ),
                      ],
                    ),
                  ),
                );
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

class BestPlaces extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Column(
        children: [
          CircleAvatar(radius: 40, child: Text('Best')),
          Text('Best Place'),
        ],
      ),
    );
  }
}
