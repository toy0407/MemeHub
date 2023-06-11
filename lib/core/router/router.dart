import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/saved_memes_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/saved',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const SavedMemesPage(),
      ),
    ],
  );
}