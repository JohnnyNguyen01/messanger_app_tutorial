import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Messaging Screen
class MessagingScreen extends HookWidget {
  /// Messages Constructor
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Messaging Screen'),
      ),
      body: Center(
        child: Text('Congratulations!'),
      ));
}
