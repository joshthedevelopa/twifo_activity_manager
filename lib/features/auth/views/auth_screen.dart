import '../../../imports.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: Column(
              children: [],
            ),
          ),
          if (context.isDesktop)
            const Expanded(
              child: SizedBox(),
            ),
        ],
      ),
    );
  }
}
