import 'package:chat_gpt/view_models/theme_view_model.dart';
import 'package:chat_gpt/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Chat GPT',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      actions: [
        Row(
          children: [
            Consumer(
              builder: (context, ref, child) => Icon(
                ref.watch(ThemeViewModel.themeProvider) == Themes.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
            const SizedBox(width: 8),
            const ThemeSwitch(),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
