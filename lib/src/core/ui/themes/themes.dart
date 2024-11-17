import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          primaryColor: Colors.green, // Represents finances and growth
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueAccent, // Stability and trust
            foregroundColor: Colors.white,
            elevation: 1,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white, // Background color for BottomNavBar
            selectedItemColor: Colors.green, // Active icon and label color
            unselectedItemColor: Colors.grey, // Inactive icon and label color
          ),
          colorScheme: const ColorScheme.light(
            primary: Colors.green,
            secondary: Colors.blueAccent,
            surface: Colors.white,
            error: Colors.redAccent,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onError: Colors.white,
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green, // Consistent with primary color
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        );

      case ThemeModeType.dark:
        return ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.greenAccent, // Softer green for dark mode
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey[900], // A darker blue-grey for stability
            foregroundColor: Colors.white,
            elevation: 1,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[900], // Background color for BottomNavBar
            selectedItemColor: Colors.tealAccent, // Active icon and label color
            unselectedItemColor: Colors.grey, // Inactive icon and label color
          ),
          colorScheme: ColorScheme.dark(
            primary: Colors.greenAccent,
            secondary: Colors.tealAccent,
            surface: Colors.grey[800]!,
            error: Colors.redAccent,
            onPrimary: Colors.black,
            onSecondary: Colors.black,
            onSurface: Colors.white,
            onError: Colors.black,
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.white54),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.tealAccent, // Secondary color for contrast
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[900],
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
