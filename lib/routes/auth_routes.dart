import '../imports.dart';

base class AuthRoute extends AppRoute {
  final AuthRouteType type;

  const AuthRoute([this.type = AuthRouteType.signin]);

  @override
  String get path => '/auth';

  @override
  GoRoute get route {
    return GoRoute(
      path: path,
      builder: (context, state) {
        return const AuthScreen();
      },
    );
  }
}
