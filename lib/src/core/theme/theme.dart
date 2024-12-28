import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'colors.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeModeType>(
      (ref) => ThemeProvider(),
);

enum ThemeModeType { light, dark }

class ThemeProvider extends StateNotifier<ThemeModeType> {
  ThemeProvider() : super(ThemeModeType.light);

  void toggleTheme() {
    state = state == ThemeModeType.light ? ThemeModeType.dark : ThemeModeType.light;
  }

  void setDefaultTheme(ThemeModeType themeModeType) {
    state = themeModeType;
  }

  ThemeData get themeData {
    switch (state) {
      case ThemeModeType.light:
        return ThemeData(
          brightness: Brightness.light,
          // Primary color from colors.dart
          primaryColor: primaryLightColor,
          scaffoldBackgroundColor: backgroundLightColor,

          // AppBar
          appBarTheme: AppBarTheme(
            backgroundColor: primaryLightColor,
            foregroundColor: Colors.white,
            elevation: 1,
          ),

          // Bottom Navigation Bar
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: backgroundLightColor,
            selectedItemColor: primaryLightColor,
            unselectedItemColor: secondaryLightColor,
          ),

          // Color Scheme for overall theming
          colorScheme: ColorScheme.light(
            primary: primaryLightColor,
            secondary: secondaryLightColor,
            background: backgroundLightColor,
            surface: surfaceLightColor,
            error: errorLightColor,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onBackground: Colors.black,
            onSurface: Colors.black,
            onError: Colors.white,
          ),

          // Text Theme
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
          ),

          // FloatingActionButton
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryLightColor,
          ),

          // TextField / Input Styles
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: surfaceLightColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        );

      case ThemeModeType.dark:
        return ThemeData(
          brightness: Brightness.dark,
          // Primary color from colors.dart
          primaryColor: primaryDarkColor,
          scaffoldBackgroundColor: backgroundDarkColor,

          // AppBar
          appBarTheme: AppBarTheme(
            backgroundColor: primaryDarkColor,
            foregroundColor: Colors.white,
            elevation: 1,
          ),

          // Bottom Navigation Bar
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: backgroundDarkColor,
            selectedItemColor: primaryDarkColor,
            unselectedItemColor: secondaryDarkColor,
          ),

          // Color Scheme for overall theming
          colorScheme: ColorScheme.dark(
            primary: primaryDarkColor,
            secondary: secondaryDarkColor,
            background: backgroundDarkColor,
            surface: surfaceDarkColor,
            error: errorDarkColor,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onBackground: Colors.white,
            onSurface: Colors.white,
            onError: Colors.black,
          ),

          // Text Theme
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.white54),
          ),

          // FloatingActionButton
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryDarkColor,
          ),

          // TextField / Input Styles
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: surfaceDarkColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        );

      default:
        return ThemeData.light();
    }
  }
}