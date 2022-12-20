import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/app/gen/colors.gen.dart';
import 'package:job_finder/features/auth/domain/blocs/auth_bloc.dart';

import 'router/app_router.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final goRouter = AppRouter.createRouter(context.read<AuthBloc>());
  final textTheme = GoogleFonts();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        typography: Typography(
          black: TextTheme(
//--------------------------------------------------------------------------

       displayLarge: GoogleFonts.dmSans(
                fontSize: 46,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                height: 1.0),

            displayMedium: GoogleFonts.dmSans(
                fontSize: 40,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                height: 1.0),

            displaySmall: GoogleFonts.dmSans(
                fontSize: 36,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                height: 1.0),

//----------------------------------------------------------------------------

            headlineLarge: GoogleFonts.dmSans(
                fontSize: 30, color: AppColors.deepInk), // 32

            headlineMedium: GoogleFonts.dmSans(
                fontSize: 26, color: AppColors.deepInk), // 32


            headlineSmall: GoogleFonts.dmSans(
                fontSize: 23,
                color: AppColors.deepInk,
                fontWeight: FontWeight.w700), // 32
//------------------------------------------------------------------------------

             titleLarge:
                GoogleFonts.dmSans(fontSize: 24, color: AppColors.lighInk,fontWeight: FontWeight.w700),

             titleMedium:
                GoogleFonts.dmSans(fontSize: 20, color: AppColors.lighInk,fontWeight: FontWeight.w700),

             titleSmall:
                GoogleFonts.dmSans(fontSize: 16, color: AppColors.lighInk,fontWeight: FontWeight.w700),

//-----------------------------------------------------------------------------
            bodyLarge:
                GoogleFonts.dmSans(fontSize: 16, color: AppColors.lighInk),

            bodyMedium:
                GoogleFonts.dmSans(fontSize: 14, color: AppColors.lighInk),

            bodySmall:
                GoogleFonts.dmSans(fontSize: 12, color: AppColors.lighInk), 
               
            labelLarge:
                GoogleFonts.dmSans(fontSize: 16, color: AppColors.deepInk,fontWeight: FontWeight.w700), 

            labelMedium:
                GoogleFonts.dmSans(fontSize: 14, color: AppColors.deepInk,fontWeight: FontWeight.w700), 

            labelSmall:
                GoogleFonts.dmSans(fontSize: 12, color: AppColors.deepInk,fontWeight: FontWeight.w700), //12

//-----------------------------------------------------------------------------

          ),
          // white: TextTheme(),
        ),
        // textTheme: TextTheme(
        // displayLarge: TextStyle(),// 57
        // displayMedium: TextStyle(),// 45
        // displaySmall: TextStyle(), // 36
        // headlineLarge: TextStyle(), // 32
        // headlineMedium:  TextStyle(), // 28
        // headlineSmall:TextStyle() ,//24
        // titleLarge: TextStyle(),//22
        // titleMedium: TextStyle(),// 16
        // titleSmall: TextStyle(),//14
        // bodyLarge: TextStyle(),//16
        // bodyMedium: TextStyle(),//14
        // bodySmall: TextStyle(),//12
        // labelLarge: TextStyle(),// 14
        // labelMedium: TextStyle(),// 12
        // labelSmall: TextStyle(),//11
        // ),
      ),
    );
  }
}
