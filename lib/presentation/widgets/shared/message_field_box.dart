import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final outlineColor = UnderlineInputBorder(
      borderSide: BorderSide(color: colorScheme.outline),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje sapo',
      enabledBorder: outlineColor,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final message = textController.value.text;
          widget.onValue(message);
          textController.clear();
          focusNode.requestFocus();
        },
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );

    return TextField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onSubmitted: (value) {
        widget.onValue(value);
        textController.clear();
        Future.delayed(const Duration(milliseconds: 100), () {
          focusNode.requestFocus();
        });
      },
      onChanged: (value) {
        print('Message changed: $value');
      },
    );
  }
}
