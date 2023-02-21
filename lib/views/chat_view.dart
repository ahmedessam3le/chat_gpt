import 'package:chat_gpt/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text('Chat View'),
      ),
    );
  }
}
