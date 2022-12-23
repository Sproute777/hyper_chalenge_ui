part of 'app_routes.dart';

@TypedGoRoute<ForgotPasswordRoute>(
  path: '/forgot_password',
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context) => const ForgotPasswordScreen();
}