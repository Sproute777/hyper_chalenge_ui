import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:job_finder/features/login/view/widgets/google_button.dart';
import 'package:job_finder/features/login/view/widgets/submitted_button.dart';
import 'package:job_finder/shared/extenstion.dart';
import 'package:job_finder/shared/router/routes/app_routes.dart';
import 'package:job_finder/shared/theme/colors.dart';
import 'package:job_finder/features/auth/domain/repositories/user_repository.dart';
import 'package:job_finder/features/login/domain/bloc/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context)),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.paperWhite,
        body: Column(children: <Widget>[

              const  Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 80),
                Center(
                  child: Text(
                    'Welcome Back',
                    style: context.h1?.apply(color: AppColors.textTitle),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                      textAlign: TextAlign.center,
                      style: context.bodySmall?.apply(color: AppColors.textBody),
                    ),
                  ),
                ),
                const SizedBox(height: 54),
                Text(
                  'email',
                  style: context.titleSmall?.apply(color: AppColors.textTitle),
                ),
                const SizedBox(height: 10),
                _EmailInput(),
                const SizedBox(height: 15),
                Text(
                  'password',
                  style: context.titleSmall?.apply(color: AppColors.textTitle),
                ),
                const SizedBox(height: 10),
                _PasswordInput(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox.square(
                          dimension: 24,
                          child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor:
                                  MaterialStateProperty.all(AppColors.checkbox),
                              checkColor: AppColors.textBody,
                              side: BorderSide.none,
                              value: true,
                              onChanged: (v) {}),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Remember me',
                          style: context.bodySmall
                              ?.apply(color: AppColors.textGrey),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: ()=> const CheckYourEmailRoute().go(context),
                      child: Text(
                        'Forgot Password ?',
                        style:
                            context.bodySmall?.apply(color: AppColors.textTitle),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: const <Widget>[
                       _LoginButton(),
                       SizedBox(height: 19),
                      _GoogleSigninButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'You don\'t have an account yet?  ',
                          style: context.bodySmall
                              ?.apply(color: AppColors.textBody),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => const SignupRoute().go(context),
                              text: 'Sign up',
                              style: context.bodySmall
                                  ?.apply(color: AppColors.textOrange),
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
const Spacer()

        ]),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.status != current.status,
        builder: (context, state) {
          return SubmittedButton(
              title: 'LOGIN',
              onTap:
               state.status.isValidated
                  ? () {
                      context
                          .read<LoginBloc>()
                          .add(const LoginSubmitted());
                    }
                  : null,
              isLoading: state.status.isSubmissionInProgress);
        }
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

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
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
            key: const Key('loginForm_passwordInput_textField'),
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
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child:Icon(Icons.visibility_off_outlined,size: 24,color: AppColors.textBody,) 
              ),
              errorText: state.password.invalid ? 'invalid password' : null,
            ),
          ),
        );
      },
    );
  }
}

class _GoogleSigninButton extends StatelessWidget {
  const _GoogleSigninButton({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
       return GoogleButton(onTap: (){} ,title:'SIGN IN WITH GOOGLE');
       }
}
