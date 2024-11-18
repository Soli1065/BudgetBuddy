import 'package:flutter/material.dart';
import '../features/features.dart';
import 'app_routes.dart';


RouteFactory generateRoutes() {
  return (RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.base:
        return MaterialPageRoute(builder: (_) => const BasePage());
      // case AppRoutes.settings:
      //   return MaterialPageRoute(builder: (_) => const SettingsPage());
      // case AppRoutes.reports:
      //   return MaterialPageRoute(builder: (_) => const ReportsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  };
}
