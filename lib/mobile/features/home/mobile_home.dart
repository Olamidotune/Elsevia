import 'package:flutter/material.dart';
import 'package:go_travel/constants/app_spacing.dart';
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
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(AppSpacing.horizontalSpacingMedium),
        child: const Column(children: [AppSearchBar()]),
      ),
    );
  }
}
