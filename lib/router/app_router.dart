import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_travel/mobile/features/explore/mobile_explore.dart';
import 'package:go_travel/mobile/features/home/mobile_home.dart';
import 'package:go_travel/mobile/features/profile/mobile_profile.dart';
import 'package:go_travel/mobile/features/saved/mobile_saved.dart';
import 'package:go_travel/router/app_shell.dart';

final appRouter = GoRouter(
  initialLocation: MobileHome.routeName,
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text(state.error.toString()))),
  routes: [
    //this indexedStack is the bottomNavBar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MobileHome.routeName,
              builder: (context, state) => const MobileHome(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MobileExplore.routeName,
              builder: (context, state) => const MobileExplore(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MobileSaved.routeName,
              builder: (context, state) => const MobileSaved(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MobileProfile.routeName,
              builder: (context, state) => const MobileProfile(),
            ),
          ],
        ),
      ],
    ),
  ],
);
