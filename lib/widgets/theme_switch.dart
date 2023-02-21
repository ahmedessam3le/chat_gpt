import 'package:chat_gpt/view_models/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitch extends ConsumerStatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  ConsumerState<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends ConsumerState<ThemeSwitch> {
  void toggleTheme(bool value) {
    ref.read(ThemeViewModel.themeProvider.notifier).state =
        value ? Themes.dark : Themes.light;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: ref.watch(ThemeViewModel.themeProvider) == Themes.dark,
      onChanged: toggleTheme,
    );
  }
}
