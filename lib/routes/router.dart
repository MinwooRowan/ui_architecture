import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/presentation/screen/home/home_screen.dart';
import 'package:provider_architectire/presentation/screen/splash/root_screen.dart';
import 'package:provider_architectire/presentation/screen/splash/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/${HomeScreen.route}',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootScreen(),
        routes: [
          GoRoute(
            path: SplashScreen.route,
            name: SplashScreen.route,
            builder: (context, state) {
              return const SplashScreen();
            },
          ),
          GoRoute(
            path: HomeScreen.route,
            name: HomeScreen.route,
            builder: (context, state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage buildWithFadetTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  int duration = 0,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: Duration(milliseconds: duration),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
