import 'package:chat_gpt/models/chat_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<List<ChatModel>> {
  ChatViewModel() : super([]);

  static final chatsProvider =
      StateNotifierProvider<ChatViewModel, List<ChatModel>>(
          (ref) => ChatViewModel());

  void add(ChatModel message) {
    state = [...state, message];
  }

  void removeTypingMessage() {
    state = state..removeWhere((message) => message.id == 'typing');
  }
}
