import 'package:flutter/material.dart';
import 'package:job_finder/app/app_multi_bloc.dart';

import 'app_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMultiBloc(child: AppView());
  }
}