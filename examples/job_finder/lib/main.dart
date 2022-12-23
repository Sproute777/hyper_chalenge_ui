import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'shared/app.dart';
import 'shared/theme/colors.dart';

void main() {

 WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor:  AppColors.black,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}

