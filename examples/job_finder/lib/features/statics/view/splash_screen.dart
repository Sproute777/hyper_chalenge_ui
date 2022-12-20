import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/app/gen/assets.gen.dart';
import 'package:job_finder/app/gen/colors.gen.dart';
import 'package:job_finder/app/router/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).typography;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 50, right: 32),
                  alignment: Alignment.centerRight,
                  child: Text('Jobspot',
                      style: typography.black.headlineSmall /* 23 */)),
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
                        style: typography.black.displayMedium,
                      ),
                      Text('Dream Job',
                          style: typography.black.displayMedium?.apply(
                            decoration: TextDecoration.underline,
                            color: AppColors.orange,
                          )),
                      Text('Here!', style: typography.black.displayMedium),
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
                  style: typography.black.bodySmall,
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
