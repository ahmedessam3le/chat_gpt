import 'package:chat_gpt/constants/enums.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final InputMode inputMode;
  final VoidCallback sendTextMessage;
  final VoidCallback sendVoiceMessage;
  final bool isReplying;
  final bool isListening;
  const ToggleButton({
    Key? key,
    required this.inputMode,
    required this.sendTextMessage,
    required this.sendVoiceMessage,
    required this.isReplying,
    required this.isListening,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: widget.isReplying
          ? null
          : widget.inputMode == InputMode.text
              ? widget.sendTextMessage
              : widget.sendVoiceMessage,
      child: Icon(
        widget.inputMode == InputMode.text
            ? Icons.send
            : widget.isListening
                ? Icons.mic_off
                : Icons.mic,
      ),
    );
  }
}
