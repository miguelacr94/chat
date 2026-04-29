import 'package:flutter/material.dart';
import 'package:my_flutter_app/domain/entities/message.dart';
import 'package:my_flutter_app/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hello amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      getAnswer();
    }
    notifyListeners();
    await moveScrollToBottom();
  }

  Future<void> getAnswer() async {
    final answer = await getYesNoAnswer.getAnswer();
    messageList.add(answer);
    notifyListeners();
    await moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
