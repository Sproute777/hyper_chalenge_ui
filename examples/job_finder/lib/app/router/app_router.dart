import 'package:go_router/go_router.dart';

import '../../features/auth/domain/blocs/auth_bloc.dart';
import 'routes/app_routes.dart';


abstract class AppRouter {

static GoRouter createRouter(AuthBloc authBloc ) {
  return GoRouter(
    initialLocation: const InitialRoute().location,
routes: $appRoutes

  );
}

}