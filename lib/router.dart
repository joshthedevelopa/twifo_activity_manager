import 'imports.dart';

mixin AppRouterMixin {
  final AppRouter router = AppRouter.instance;
}

final class AppRouter {
  static final AppRouter instance = AppRouter();

  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    routes: [],
  );
}
