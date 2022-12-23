part of 'app_routes.dart';


@TypedGoRoute<SuccessfullyRoute>(
  path: '/successfully',
)
class SuccessfullyRoute extends GoRouteData {
  const SuccessfullyRoute();

  @override
  Widget build(BuildContext context) => const SuccessfullyScreen();
}