import 'package:flutter/material.dart';

class AppTheme {
  //Colors light theme
  static const primaryColor = Color(0xFFFFFFFF);
  static const secondaryColor = Color(0xFFD9D9DE);
  static const iconsColor = Color(0xFF404258);
  static const textColor = Color(0xFF13141A);
  static const tertiaryColor = Color(0xFF9561E6);

  static const primaryColorDark = Color(0xFF13141A);
  static const secondaryColorDark = Color(0xFF1F1F27);
  static const iconsColorDark = Color(0xFFA0A1AC);
  static const textColorDark = Color(0XFFFFFFFF);
  static const tertiaryColorDark = Color(0xFFA66CFF);

  const AppTheme._();

  static final lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      textTheme: const TextTheme(bodyLarge: TextStyle(color: textColor)),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      ),
      iconTheme: const IconThemeData(color: iconsColor));
  static final darkTheme = ThemeData(
      primaryColor: primaryColorDark,
      scaffoldBackgroundColor: primaryColorDark,
      textTheme: const TextTheme(bodyLarge: TextStyle(color: textColorDark)),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColorDark,
          secondary: secondaryColorDark,
          tertiary: tertiaryColorDark),
      iconTheme: const IconThemeData(color: iconsColorDark));
}
