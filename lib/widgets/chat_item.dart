import 'package:chat_gpt/widgets/profile_container.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String message;
  final bool isMe;
  const ChatItem({Key? key, required this.message, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            Row(
              children: [
                ProfileContainer(
                  isMe: isMe,
                ),
                const SizedBox(width: 10),
              ],
            ),
          Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            decoration: BoxDecoration(
              color: isMe
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.grey.shade800,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 16),
              ),
            ),
            child: Text(
              message,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          if (isMe)
            Row(
              children: [
                const SizedBox(width: 10),
                ProfileContainer(
                  isMe: isMe,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
