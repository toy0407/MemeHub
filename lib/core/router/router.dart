import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/settings_page.dart';
import '../../presentation/pages/profile_page.dart';
import '../../dependency_injection.dart';
import '../../presentation/bloc/meme_bloc.dart';
import '../../presentation/pages/home_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => HomePage(
          memeBloc: sl<MemeBloc>(),
        ),
      ),
      GoRoute(
        path: '/profile',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/settings',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
