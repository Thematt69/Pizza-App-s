// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:pizza_app_s/colors.dart';

mixin CustomTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: CustomColors.background,
    dialogBackgroundColor: CustomColors.surface,
    colorScheme: const ColorScheme.dark(
      primary: CustomColors.primary,
      onPrimary: CustomColors.onPrimary,
      secondary: CustomColors.secondary,
      onSecondary: CustomColors.onSecondary,
      background: CustomColors.background,
      onBackground: CustomColors.onBackground,
      error: CustomColors.error,
      onError: CustomColors.onError,
      surface: CustomColors.surface,
      onSurface: CustomColors.onSurface,
    ),
    fontFamily: 'Supersonic-Rocketship',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6.5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14.5),
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: CustomColors.surface,
    ),
    listTileTheme: const ListTileThemeData(
      selectedColor: CustomColors.secondary,
    ),
  );
}
