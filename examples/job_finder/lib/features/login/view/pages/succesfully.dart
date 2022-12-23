import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:job_finder/app/gen/assets.gen.dart';
import 'package:job_finder/shared/extenstion.dart';
import 'package:job_finder/shared/theme/colors.dart';
import 'package:job_finder/features/auth/domain/repositories/user_repository.dart';
import 'package:job_finder/features/login/domain/bloc/login_bloc.dart';


class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context)),
      child: const _SuccessfullyScreenView(),
    );
  }
}

class _SuccessfullyScreenView extends StatelessWidget {
  const _SuccessfullyScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.paperWhite,
        body: Center(
          child: Column(children: <Widget>[
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Successfully',
                      style: context.h1?.apply(color: AppColors.textTitle),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Your password has been updated, please change your password regularly to avoid this happening',
                      textAlign: TextAlign.center,
                      style:
                          context.bodySmall?.apply(color: AppColors.textBody),
                    ),
                  ),
                  const SizedBox(height: 52),
                  Center(
                    child: SizedBox(
                      height: 94,
                      child:
                          SvgPicture.asset(Assets.images.forgotPassword.path),
                    ),
                  ),
                  const SizedBox(height: 72),
               
                  Column(
                    children: [
                      _LoginButton(),
                      const SizedBox(height: 19),
                      _LoginButton(),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const Spacer(flex: 3)
          ]),
        ),
      ),
    );
  }
}


class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox(
          height: 50,
          child: state.status.isSubmissionInProgress
              ? const CircularProgressIndicator()
              : TextButton(
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.buttonBlue,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {},
                  // state.status.isValidated
                  // ? () {
                  //     context.read<LoginBloc>().add(const LoginSubmitted());
                  //   }
                  // : null,
                  child: const Text('SIGN UP'),
                ),
        );
      },
    );
  }
}



