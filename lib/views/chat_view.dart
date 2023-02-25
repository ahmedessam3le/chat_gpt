import 'package:chat_gpt/view_models/chat_view_model.dart';
import 'package:chat_gpt/widgets/chat_item.dart';
import 'package:chat_gpt/widgets/my_app_bar.dart';
import 'package:chat_gpt/widgets/text_and_voice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              child: Consumer(
                builder: (context, ref, child) {
                  final chat = ref.watch(ChatViewModel.chatsProvider);
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: chat.length,
                    itemBuilder: (context, index) => ChatItem(
                      message: chat[index].message,
                      isMe: chat[index].isMe,
                    ),
                  );
                },
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
