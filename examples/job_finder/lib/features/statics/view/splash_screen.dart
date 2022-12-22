import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/shared/extenstion.dart';
import '/shared/gen/assets.gen.dart';
import '/shared/gen/colors.gen.dart';
import '/shared/router/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 50, right: 32),
                  alignment: Alignment.centerRight,
                  child: Text('Jobspot',
                      style: context.h4?.apply(color: AppColors.black) )),
              Expanded(
                child: SvgPicture.asset(Assets.images.splashIntro.path),
              ),
              Container(
                padding: const EdgeInsets.only(left: 28),
                alignment: Alignment.centerLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Find Your',
                        style: context.displaySmall?.apply(color: Colors.black),
                      ),
                      Text('Dream Job',
                          style: context.displaySmall?.apply(
                            decoration: TextDecoration.underline,
                            color: AppColors.orange,
                          )),
                      Text('Here!', style: context.displaySmall?.apply(color: Colors.black)),
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 28),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Explore all the most exciting job roles based\non your interest and study major.',
                  style: context.bodyMedium?.apply(color: AppColors.lighInk),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 26, bottom: 39),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      LoginRoute(fromPage: const SplashRoute().location).go(context);
                    },
                    child: SvgPicture.asset(Assets.images.circleArrow.path)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
