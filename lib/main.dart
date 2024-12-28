import 'package:budget_buddy/src/core/theme/theme.dart';
import 'package:budget_buddy/src/routes/app_routes.dart';
import 'package:budget_buddy/src/routes/route_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(themeProvider); // Watching the theme state
    final themeData = ref.read(themeProvider.notifier).themeData;

    return MaterialApp(
      title: 'BudgetBuddy',
      debugShowCheckedModeBanner: false,
      theme: themeData, // Light theme
      darkTheme: themeData, // Dark theme
      themeMode: themeMode == ThemeModeType.light ? ThemeMode.light : ThemeMode.dark,
      // home: const BasePage(),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: generateRoutes(),
    );
  }
}
