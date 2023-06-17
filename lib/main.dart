import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:memehub/core/router/router.dart';
import 'package:memehub/presentation/bloc/meme_bloc.dart';

import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter router = AppRouter.router;

    return MultiBlocProvider(
      providers: [
        BlocProvider<MemeBloc>(create: (_) => di.sl<MemeBloc>()),
      ],
      child: MaterialApp.router(
        title: 'MemeHub',
        themeMode: ThemeMode.dark,
        theme: ThemeData(primarySwatch: Colors.amber),
        darkTheme: ThemeData(primarySwatch: Colors.amber),
        routerConfig: router,
      ),
    );
  }
}
