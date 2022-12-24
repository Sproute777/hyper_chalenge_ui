import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/app/gen/assets.gen.dart';
import 'package:job_finder/shared/extenstion.dart';
import 'package:job_finder/shared/router/routes/app_routes.dart';
import 'package:job_finder/shared/theme/colors.dart';
import 'package:job_finder/features/auth/domain/repositories/user_repository.dart';
import 'package:job_finder/features/login/domain/bloc/login_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context)),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView({Key? key}) : super(key: key);
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
                      'Forgot Password?',
                      style: context.h1?.apply(color: AppColors.textTitle),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'To reset your password, you need your email or mobile number that can be authenticated',
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
                  Text(
                    'email',
                    style:
                        context.titleSmall?.apply(color: AppColors.textTitle),
                  ),
                  const SizedBox(height: 10),
                  _EmailInput(),
                  const SizedBox(height: 29),
                  Column(
                    children: [
                      _ResetPasswordButton(),
                      const SizedBox(height: 29),
                      _BackToLoginButton(),
                    ],
                  ),
                  // const SizedBox(height: 16),
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

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextField(
            key: const Key('loginForm_emailInput_textField'),
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              fillColor: AppColors.white,
              filled: true,
              constraints: const BoxConstraints(minHeight: 50),
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              errorText: state.password.invalid ? 'invalid email' : null,
            ),
          ),
        );
      },
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            foregroundColor: Colors.white,
            backgroundColor: AppColors.buttonBlue,
            minimumSize: Size(MediaQuery.of(context).size.width, 50)),
        onPressed: () {},
        child: const Text('RESET PASSWORD'),
      ),
    );
  }
}

class _BackToLoginButton extends StatelessWidget {
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
            minimumSize: Size(MediaQuery.of(context).size.width, 50)),
        onPressed: () => const LoginRoute().go(context),
        child: const Text('BACK TO LOGIN'),
      ),
    );
  }
}
