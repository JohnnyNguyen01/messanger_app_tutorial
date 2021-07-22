import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Obtain the app screen [Size] of the building [HookWidget].
Size useScreenSize({BuildContext? context}) =>
    MediaQuery.of(context ?? useContext()).size;

/// Hook to use app theme
ThemeData useTheme({BuildContext? context}) =>
    Theme.of(context ?? useContext());
