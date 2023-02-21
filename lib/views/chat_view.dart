import 'package:chat_gpt/widgets/my_app_bar.dart';
import 'package:chat_gpt/widgets/text_and_voice_field.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) => const Text('List'),
            ),
          ),
          const TextAndVoiceField(),
        ],
      ),
    );
  }
}
