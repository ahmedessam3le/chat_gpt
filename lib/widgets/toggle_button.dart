import 'package:chat_gpt/constants/enums.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final InputMode inputMode;
  const ToggleButton({Key? key, required this.inputMode}) : super(key: key);

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
      onPressed: () {},
      child: Icon(widget.inputMode == InputMode.text ? Icons.send : Icons.mic),
    );
  }
}
