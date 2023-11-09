import 'package:go_router/go_router.dart';
import 'package:tasbeeh/core/navigation/route.dart';
import 'package:tasbeeh/features/screens.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoute.adkar.path,
      builder: (context, state) => const AdkarScreen(),
    ),
    GoRoute(
      path: AppRoute.tasbeeh.path,
      builder: (context, state) => const TasbeehScreen(),
    ),
    GoRoute(
      path: AppRoute.settings.path,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
