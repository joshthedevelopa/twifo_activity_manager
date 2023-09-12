import 'imports.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AppRouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.name,
      debugShowCheckedModeBanner: false,
      routerConfig: router.router,
    );
  }
}
