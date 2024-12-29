import 'package:hive/hive.dart';

import '../../../../storage/storage_service.dart';
import '../models/expense.dart';

class HiveExpenseService implements StorageService<Expense> {
  static const String _boxName = 'expensesBox';

  @override
  Future<List<Expense>> getAll() async {
    final box = Hive.box(_boxName);
    return box.values.cast<Expense>().toList();
  }

  @override
  Future<void> add(Expense expense) async {
    final box = Hive.box(_boxName);
    await box.put(expense.id, expense);
  }

  @override
  Future<void> update(Expense expense) async {
    final box = Hive.box(_boxName);
    if (box.containsKey(expense.id)) {
      await box.put(expense.id, expense);
    }
  }

  @override
  Future<void> delete(String id) async {
    final box = Hive.box(_boxName);
    await box.delete(id);
  }
}