import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/providers/auth.dart';

/// Error Screen
class ErrorScreen extends HookWidget {
  /// Error Screen constructor
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Error 404'),
      ),
      body: authState.when(
        unAuthenticated: () => null,
        authenticated: (_) => null,
        loading: () => null,
        signedUpFirstTime: (_, __, ___) => null,
        error: (error) => Center(
          child: Text(
            error ?? 'Something went wrong',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
