import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_travel/constants/app_colors.dart';
import 'package:go_travel/mobile/bloc/weather/weather_bloc.dart';

class AppSearchBar extends StatefulWidget {
  const new({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: AppColors.blackColor),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      backgroundColor: WidgetStateProperty.all(AppColors.whiteColor),
      leading: SvgPicture.asset('assets/svg/search.svg'),
      hintText: 'Search destination',
      hintStyle: WidgetStateProperty.all(
        const TextStyle(color: AppColors.greyColor),
      ),
      controller: _controller,
      onSubmitted: (value) =>
          context.read<WeatherBloc>().add(const WeatherEvent.fetchWeather()),
      onChanged: (value) {
        context.read<WeatherBloc>().add(WeatherEvent.searchValueChanged(value));

        value.length > 3
            ? context.read<WeatherBloc>().add(const WeatherEvent.fetchWeather())
            : null;
        setState(() {});
      },
      trailing: [
        if (_controller.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              context.read<WeatherBloc>().add(
                const WeatherEvent.searchValueChanged(' '),
              );
              setState(() {});
            },
          ),
      ],
    );
  }
}
