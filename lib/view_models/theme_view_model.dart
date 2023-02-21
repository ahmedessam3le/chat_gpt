import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeViewModel {
  static final themeProvider = StateProvider<Themes>((ref) => Themes.dark);
}

enum Themes { light, dark }
