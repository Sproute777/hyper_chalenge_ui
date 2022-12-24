part of 'app_routes.dart';



@TypedGoRoute<CheckYourEmailRoute>(
  path: '/check-your-email',
)
class CheckYourEmailRoute extends GoRouteData {
  const CheckYourEmailRoute();

  @override
  Widget build(BuildContext context) => const CheckYourEmailScreen();
}