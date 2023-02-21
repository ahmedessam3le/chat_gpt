import 'package:chat_gpt/widgets/chat_item.dart';
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) => const ChatItem(
                  message:
                      'This is me This is me This is me This is me This is me This is me This is me This is me This is me ',
                  isMe: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const TextAndVoiceField(),
        ],
      ),
    );
  }
}
