import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.deepOrange,
          onSecondary: Colors.white,
        ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: Colors.blueGrey,
          onPrimary: Colors.white,
          secondary: Colors.blueGrey,
          onSecondary: Colors.white,
        ),
  );
}
