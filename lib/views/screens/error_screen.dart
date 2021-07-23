import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Error Screen
class ErrorScreen extends HookWidget {
  /// Error Screen constructor
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Error 404'),
        ),
        body: Center(
          child: Text('Error, something went wrong'),
        ),
      );
}
