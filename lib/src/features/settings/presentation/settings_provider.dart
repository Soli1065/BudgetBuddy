

import 'package:budget_buddy/src/core/ui/themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_state.dart';

final settingsProvider = Provider<SettingsState>((ref) {
  final themeMode = ref.watch(themeProvider);
  return SettingsState(isDarkMode: themeMode == ThemeModeType.dark);
});


void toggleAppTheme(WidgetRef ref){
  final themeNotifier = ref.read(themeProvider.notifier);
  themeNotifier.toggleTheme();
}