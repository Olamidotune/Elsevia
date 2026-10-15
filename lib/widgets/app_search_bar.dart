import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_travel/constants/app_colors.dart';
import 'package:go_travel/mobile/bloc/weather/weather_bloc.dart';

class AppSearchBar extends HookWidget {
  const new({super.key});

  static const _minChars = 2;
  static const _debounceDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherBloc>();

    // 1. Controller: created once, disposed automatically.
    final controller = useTextEditingController();

    // 2. Rebuilds this widget whenever the text changes.
    final text = useValueListenable(controller).text;

    // 3. Holds the debounce timer between rebuilds (changing it does not rebuild).
    final debounce = useRef<Timer?>(null);

    // 4. Cancels any pending timer when the widget is removed.
    useEffect(
      () =>
          () => debounce.value?.cancel(),
      const [],
    );

    void search(String query) {
      bloc
        ..add(WeatherEvent.searchValueChanged(query))
        ..add(const WeatherEvent.fetchWeather());
    }

    void onChanged(String value) {
      debounce.value?.cancel();
      final query = value.trim();

      if (query.length < _minChars) {
        bloc.add(const WeatherEvent.clearSearchCities());
        return;
      }

      debounce.value = Timer(_debounceDuration, () => search(query));
    }

    void onSubmitted(String value) {
      debounce.value?.cancel();
      final query = value.trim();
      if (query.length >= _minChars) search(query);
    }

    void onClear() {
      debounce.value?.cancel();
      controller.clear();
      bloc.add(const WeatherEvent.clearSearchCities());
    }

    return SearchBar(
      controller: controller,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(color: AppColors.blackColor),
      ),
      backgroundColor: WidgetStateProperty.all(AppColors.whiteColor),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      leading: SvgPicture.asset('assets/svg/search.svg'),
      hintText: 'Search destination',
      hintStyle: WidgetStateProperty.all(
        const TextStyle(color: AppColors.greyColor),
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      trailing: [
        if (text.isNotEmpty)
          IconButton(icon: const Icon(Icons.clear), onPressed: onClear),
      ],
    );
  }
}
