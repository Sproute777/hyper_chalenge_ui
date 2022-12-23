part of 'app_routes.dart';

@TypedGoRoute<SignupRoute>(
  path: '/signup',
)
class SignupRoute extends GoRouteData {
  const SignupRoute();

  @override
  Widget build(BuildContext context) => const SignupScreen();
}