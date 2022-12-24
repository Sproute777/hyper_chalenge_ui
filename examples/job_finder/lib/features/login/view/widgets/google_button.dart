import 'package:flutter/material.dart';
import '../../../../app/gen/assets.gen.dart';
import '../../../../shared/theme/colors.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const GoogleButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          foregroundColor: AppColors.buttonBlue,
          backgroundColor: AppColors.buttonPurpleLight,
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.google.path),
            const SizedBox(
              width: 10.0,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

