import 'package:chat_gpt/constants/enums.dart';
import 'package:chat_gpt/models/chat_model.dart';
import 'package:chat_gpt/services/ai_handler.dart';
import 'package:chat_gpt/services/voice_handler.dart';
import 'package:chat_gpt/view_models/chat_view_model.dart';
import 'package:chat_gpt/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextAndVoiceField extends ConsumerStatefulWidget {
  const TextAndVoiceField({Key? key}) : super(key: key);

  @override
  ConsumerState<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends ConsumerState<TextAndVoiceField> {
  InputMode inputMode = InputMode.voice;
  late final TextEditingController _messageController;
  final AiHandler _openAI = AiHandler();
  final VoiceHandler _voiceHandler = VoiceHandler();
  var _isReplying = false;
  var _isListening = false;

  @override
  void initState() {
    _messageController = TextEditingController();
    _voiceHandler.init();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _openAI.dispose();
    super.dispose();
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      this.inputMode = inputMode;
    });
  }

  void sendTextMessage(String message) async {
    setReplyingState(true);

    addMessageToChat(
      id: DateTime.now().toString(),
      message: message,
      isMe: true,
    );

    addMessageToChat(
      id: 'typing',
      message: 'Typing ...',
      isMe: false,
    );

    setInputMode(InputMode.voice);

    final aiResponse = await _openAI.ask(message);

    removeTyping();

    addMessageToChat(
      id: DateTime.now().toString(),
      message: aiResponse,
      isMe: false,
    );

    setReplyingState(false);
  }

  void sendVoiceMessage() async {
    if (_voiceHandler.service.isListening) {
      await _voiceHandler.stopListening();
      setListeningState(false);
    } else {
      setListeningState(true);
      final result = await _voiceHandler.startListening();
      setListeningState(false);
      sendTextMessage(result);
    }
  }

  void addMessageToChat({
    required String id,
    required String message,
    required bool isMe,
  }) {
    final chat = ref.read(ChatViewModel.chatsProvider.notifier);
    chat.add(
      ChatModel(id: id, message: message, isMe: isMe),
    );
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void setListeningState(bool isListening) {
    setState(() {
      _isListening = isListening;
    });
  }

  void removeTyping() {
    final chat = ref.read(ChatViewModel.chatsProvider.notifier);
    chat.removeTypingMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                cursorColor: Theme.of(context).colorScheme.onPrimary,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  value.trim().isNotEmpty
                      ? setInputMode(InputMode.text)
                      : setInputMode(InputMode.voice);
                },
              ),
            ),
            const SizedBox(width: 8),
            ToggleButton(
              inputMode: inputMode,
              isReplying: _isReplying,
              isListening: _isListening,
              sendTextMessage: () {
                final message = _messageController.text;
                _messageController.clear();
                sendTextMessage(message);
              },
              sendVoiceMessage: sendVoiceMessage,
            ),
          ],
        ),
      ),
    );
  }
}
