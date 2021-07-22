import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants/themes/themes.dart';
import 'views/screens/auth_screen.dart';

void main() async {
  // Added to initialise firebase and make sure it works.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

/// Root App Widget
class MyApp extends StatelessWidget {
  /// Root App widget constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Chat App',
        theme: Themes.primaryTheme,
        home: AuthScreen(),
      );
}
