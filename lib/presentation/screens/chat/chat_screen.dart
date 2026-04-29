import 'package:flutter/material.dart';
import 'package:my_flutter_app/domain/entities/message.dart';
import 'package:my_flutter_app/presentation/providers/chat_provider.dart';
import 'package:my_flutter_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:my_flutter_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:my_flutter_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Scarlett_Johansson_293_%28cropped2%29.jpg/250px-Scarlett_Johansson_293_%28cropped2%29.jpg',
            ),
          ),
        ),
        title: const Text('Mi amor 🧡'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho != FromWho.hers)
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble(text: message.text, imageUrl: message.imageUrl);
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
