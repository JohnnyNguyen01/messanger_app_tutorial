import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/hooks.dart';
import '../../../domain/providers/messages.dart';

/// Messaging Screen
class MessagingScreen extends HookWidget {
  /// Messages Constructor
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStream = useProvider(messagesProvider);
    final screenSize = useScreenSize();
    final theme = useTheme();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: messageStream.when(
        data: (messages) => Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (_, index) => Text(
                  index.toString(),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (stck, err) => Center(
          child: Text(
            err.toString(),
          ),
        ),
      ),
    );
  }
}
