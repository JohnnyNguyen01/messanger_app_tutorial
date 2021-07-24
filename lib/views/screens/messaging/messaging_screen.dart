import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/hooks.dart';
import '../../../domain/models/values/failure.dart';
import '../../../domain/providers/error.dart';
import '../../../utils/validators.dart';
import '../../../domain/providers/messages.dart';

/// Messaging Screen
class MessagingScreen extends HookWidget {
  /// Messages Constructor
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStream = useProvider(messagesProvider);
    final messageTFController = useTextEditingController();
    final messageNotifier = useProvider(userMessageProvider.notifier);
    final messageIsValid = useState(false);
    final messageTfKey = useMemoized(() => GlobalKey<FormState>());

    return ProviderListener<Failure?>(
      onChange: (context, failure) => failure != null
          ? useSnackBar(context: context, message: failure.message!)
          : null,
      provider: errorProvider,
      child: Scaffold(
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
                child: SafeArea(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (_, index) {
                        print('new message');
                        return Text(messages[index].message ?? '');
                      }),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 22,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          /// Message Text Field
                          child: Form(
                            key: messageTfKey,
                            child: TextFormField(
                              validator: StringValidators.messageValidator,
                              controller: messageTFController,
                              onChanged: (_) =>
                                  messageTfKey.currentState?.validate(),
                              decoration: InputDecoration(
                                hintText: 'Write a message...',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: messageIsValid.value
                              ? () async =>
                                  await messageNotifier.sendNewMessage(
                                      messageText: messageTFController.text)
                              : null,
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
      ),
    );
  }
}
