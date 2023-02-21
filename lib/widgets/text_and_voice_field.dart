import 'package:chat_gpt/constants/enums.dart';
import 'package:chat_gpt/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class TextAndVoiceField extends StatefulWidget {
  const TextAndVoiceField({Key? key}) : super(key: key);

  @override
  State<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends State<TextAndVoiceField> {
  InputMode inputMode = InputMode.voice;
  late final TextEditingController _messageController;

  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      this.inputMode = inputMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
          ToggleButton(inputMode: inputMode),
        ],
      ),
    );
  }
}
