import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'views/screens/auth/signup_details_screen.dart';
import 'views/screens/error_screen.dart';
import 'domain/models/states/auth/auth_state.dart';
import 'domain/providers/auth.dart';
import 'constants/themes/themes.dart';
import 'views/screens/auth/auth_screen.dart';

void main() async {
  // Added to initialise firebase and make sure it works.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Root App Widget
class MyApp extends HookWidget {
  /// Root App widget constructor
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authProvider);

    return MaterialApp(
      title: 'Chat App',
      theme: Themes.primaryTheme,
      home: Navigator(
        pages: [
          if (authState is UnAuthenticated)
            MaterialPage<AuthScreen>(
              key: ValueKey('AuthScreen'),
              child: AuthScreen(),
            ),
          if (authState is SignedUpFirstTime)
            MaterialPage<SignUpDetailsScreen>(
              key: ValueKey('SignUpDetailsScreen'),
              child: SignUpDetailsScreen(),
            ),
          if (authState is Error)
            MaterialPage<ErrorScreen>(
              key: ValueKey('ErrorScreen'),
              child: ErrorScreen(),
            ),
        ],
        // called everytime Navigator.pop() is called
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          } else {
            return true;
          }
        },
      ),
    );
  }
}
