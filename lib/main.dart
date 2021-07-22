import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                  (_) => Colors.grey.shade300),
              foregroundColor:
                  MaterialStateProperty.resolveWith((_) => Colors.black),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((_) => Colors.black),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: AuthScreen(),
      );
}
