part of 'app_routes.dart';


@TypedGoRoute<InitialRoute>(
  path: '/',
)
class InitialRoute extends GoRouteData {
  const InitialRoute();

  @override
  FutureOr<String?> redirect() => const SplashRoute().location;
}
