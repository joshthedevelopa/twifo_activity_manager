import './imports.dart';

abstract base class AppRoute {
  final Object? extra;

  String get path;
  GoRoute get route;
  Map<String, dynamic> get map => {};

  const AppRoute({this.extra});

  String parse() {
    String newPath = path;

    if (map.isEmpty) {
      return path.replaceAll(RegExp('/[?][:][a-zA-Z_]+'), "");
    }

    for (MapEntry entry in map.entries) {
      newPath = path.replaceFirst(
        RegExp("(\\?:${entry.key}|:${entry.key})"),
        entry.value ?? '',
      );
    }
    return newPath;
  }
}

mixin AppRouterMixin {
  AppRouter get router => AppRouter.instance;
}

final class AppRouter {
  static final AppRouter instance = AppRouter();

  Future<dynamic> push(AppRoute route, {bool replace = false}) async {
    if (replace) {
      return await _router.pushReplacement(
        route.parse(),
        extra: route.extra,
      );
    }

    _router.push(route.parse(), extra: route.extra);
  }

  void go(AppRoute route) {
    return _router.go(
      route.parse(),
      extra: route.extra,
    );
  }

  void back([dynamic result]) => _router.pop(result);

  RouterConfig<RouteMatchList> get router => _router;

  final GoRouter _router = GoRouter(
    initialLocation: '/auth',
    routes: [
      const AuthRoute(),
    ].map((e) => e.route).toList(),
  );
}
