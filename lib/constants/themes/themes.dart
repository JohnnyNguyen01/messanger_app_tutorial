import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

/// Holds all [ThemeData] used within app
class Themes {
  Themes._();

  /// Primary theme
  static final primaryTheme = ThemeData(
    backgroundColor: backgroundColor,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      focusColor: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.resolveWith((_) => Colors.grey.shade300),
        foregroundColor: MaterialStateProperty.resolveWith((_) => Colors.black),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((_) => Colors.black),
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
  );
}
