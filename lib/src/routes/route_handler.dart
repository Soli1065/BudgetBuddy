import 'package:flutter/material.dart';
import '../features/expense/data/models/expense.dart';
import '../features/expense/presentation/pages/add_expense_page.dart';
import '../features/expense/presentation/pages/expense_detail_page.dart';
import '../features/expense/presentation/pages/expense_list_page.dart';
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


final Map<String, WidgetBuilder> expenseRoutes = {
  '/expense/list': (context) => ExpenseListPage(),
  '/expense/add': (context) => AddExpensePage(),
  '/expense/detail': (context) {
    final expense = ModalRoute.of(context)!.settings.arguments as Expense;
    return ExpenseDetailPage(expense: expense);
  },
};