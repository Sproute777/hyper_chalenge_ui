import 'package:flutter/material.dart';
import '../../../../shared/theme/colors.dart';

class SubmittedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;

  const SubmittedButton({
    Key? key,
    required this.title,
     this.onTap,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TweenAnimationBuilder<double>(
        duration: kThemeAnimationDuration,
        curve: Curves.easeOut,
        tween: Tween(begin: 0.0, end: isLoading ? 1.0 : 0.0),
        builder: (context, anim, _) {
          return TextButton(
            style: ButtonStyle.lerp(
                TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.buttonBlue,
                    disabledBackgroundColor: Colors.grey[200],
                    disabledForegroundColor: Colors.grey,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),),
                TextButton.styleFrom(
                    shape: const CircleBorder(),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.buttonBlue,
                    // disabledBackgroundColor: Colors.grey[00],
                    // disabledForegroundColor: Colors.grey,
                    padding: const EdgeInsets.all(10.0)),
                anim),
            onPressed: onTap,
            child: isLoading
                ? const CircularProgressIndicator(color: AppColors.white,)
                :  Text(title),
          );
        },
      ),
    );
  }
}
