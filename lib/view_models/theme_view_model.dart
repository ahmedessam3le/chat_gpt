import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/enums.dart';

class ThemeViewModel {
  static final themeProvider = StateProvider<Themes>((ref) => Themes.dark);
}
