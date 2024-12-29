import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/expense.dart';
import '../services/hive_expense_service.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepository(HiveExpenseService());
});

class ExpenseRepository {
  final HiveExpenseService _service;

  ExpenseRepository(this._service);

  Future<List<Expense>> getAllExpenses() async {
    return _service.getAll();
  }

  Future<void> addExpense(Expense expense) async {
    await _service.add(expense);
  }

  Future<void> updateExpense(Expense expense) async {
    await _service.update(expense);
  }

  Future<void> removeExpense(String id) async {
    await _service.delete(id);
  }
}