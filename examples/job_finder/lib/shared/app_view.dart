import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/auth/domain/blocs/auth_bloc.dart';

import 'router/app_router.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final goRouter = AppRouter.createRouter(context.read<AuthBloc>());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
      theme: ThemeData(
        // useMaterial3: true,
        // текст тема базовая настройка размер и fontWeiht , цвета и стиль задаются динамически
textTheme: const TextTheme(

displaySmall: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
headlineLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
headlineMedium: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
headlineSmall: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
titleLarge: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
titleMedium: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
titleSmall: TextStyle(fontSize: 12 ,fontWeight: FontWeight.bold),

labelSmall: TextStyle(fontSize:  16,fontWeight: FontWeight.w400),
bodyLarge: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
bodyMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
bodySmall: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),
)
        ),
     
    );
  }
}
