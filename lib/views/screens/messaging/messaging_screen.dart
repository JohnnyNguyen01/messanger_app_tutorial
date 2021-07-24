import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/constants.dart';
import '../../../domain/models/states/auth/auth_state.dart';
import '../../../domain/providers/auth.dart';
import '../../../domain/models/values/message.dart';
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
    final messageTFNode = useMemoized(() => FocusNode());

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
                    itemBuilder: (_, index) =>
                        _MessageBubble(message: messages[index]),
                  ),
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
                            child: _buildTextField(
                                messageTFNode,
                                messageTFController,
                                messageTfKey,
                                messageIsValid),
                          ),
                        ),
                        IconButton(
                          onPressed: messageIsValid.value
                              ? () async {
                                  await messageNotifier.sendNewMessage(
                                      messageText: messageTFController.text);
                                  messageTFController.clear();
                                  messageIsValid.value == false;
                                  messageTFNode.unfocus();
                                }
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

  TextFormField _buildTextField(
          FocusNode messageTFNode,
          TextEditingController messageTFController,
          GlobalKey<FormState> messageTfKey,
          ValueNotifier<bool> messageIsValid) =>
      TextFormField(
        focusNode: messageTFNode,
        validator: StringValidators.messageValidator,
        controller: messageTFController,
        onChanged: (_) {
          if (messageTfKey.currentState != null)
            messageIsValid.value = messageTfKey.currentState!.validate();
        },
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
      );
}

class _MessageBubble extends HookWidget {
  _MessageBubble({required this.message, Key? key}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final screenSize = useScreenSize();
    final auth = useProvider(authProvider);

    final user = auth is Authenticated ? auth.user : null;
    final messageIsFromUser = user?.uid == message.uid;

    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            messageIsFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          messageIsFromUser
              ? _buildTextBubble(
                  screenSize, messageBubbleRadius, messageIsFromUser)
              : _buildCircleAvatar(messageProfileImageRadius),
          const SizedBox(width: 10),
          messageIsFromUser
              ? _buildCircleAvatar(messageProfileImageRadius)
              : _buildTextBubble(
                  screenSize, messageBubbleRadius, messageIsFromUser)
        ],
      ),
    );
  }

  Flexible _buildTextBubble(Size screenSize, double messageBubbleRadius,
          bool messageIsFromUser) =>
      Flexible(
        child: Container(
          constraints: BoxConstraints(maxWidth: screenSize.width * 0.65),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(messageBubbleRadius),
                topRight: Radius.circular(messageBubbleRadius),
                bottomRight: messageIsFromUser
                    ? Radius.zero
                    : Radius.circular(messageBubbleRadius),
                bottomLeft: messageIsFromUser
                    ? Radius.circular(messageBubbleRadius)
                    : Radius.zero,
              ),
              color: messageIsFromUser ? userTextBubbleColor : Colors.black54,
              shape: BoxShape.rectangle),
          child: Text(
            message.message ?? '',
            style: TextStyle(
                color: messageIsFromUser ? Colors.black87 : Colors.white),
          ),
        ),
      );

  CircleAvatar _buildCircleAvatar(double messageProfileImageRadius) =>
      CircleAvatar(
        radius: messageProfileImageRadius,
        child: message.profileImageUrl == null ? Icon(Icons.person) : null,
        foregroundImage: message.profileImageUrl != null
            ? CachedNetworkImageProvider(message.profileImageUrl!)
            : null,
      );
}
