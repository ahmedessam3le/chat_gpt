import 'package:chat_gpt/constants/app_themes.dart';
import 'package:chat_gpt/view_models/theme_view_model.dart';
import 'package:chat_gpt/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(ThemeViewModel.themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat GPT',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: activeTheme == Themes.light ? ThemeMode.light : ThemeMode.dark,
      home: const ChatView(),
    );
  }
}
