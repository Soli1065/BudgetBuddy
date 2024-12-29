import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_adapters/expense_adapter.dart';

class HiveService {
  static Future<void> initHive() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register the ExpenseAdapter
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ExpenseAdapter());
    }

    // Open the expenses box
    await Hive.openBox('expensesBox');
  }
}