import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Obtain the app screen [Size] of the building [HookWidget].
Size useScreenSize({BuildContext? context}) =>
    MediaQuery.of(context ?? useContext()).size;

/// Hook to use app theme
ThemeData useTheme({BuildContext? context}) =>
    Theme.of(context ?? useContext());

/// Shows a snackbar to the User
void useSnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
