import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense.dart';
import '../services/expense_services.dart';

// Provider for repository
final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepository(ref);
});

class ExpenseRepository {
  final Ref ref;

  ExpenseRepository(this.ref);

  // Fetch all expenses
  Future<List<Expense>> getAllExpenses() async {
    return await ref.read(expenseServicesProvider).fetchExpenses();
  }

  // Add a new expense
  Future<void> addExpense(Expense expense) async {
    await ref.read(expenseServicesProvider).saveExpense(expense);
  }

  // Remove an expense
  Future<void> removeExpense(String id) async {
    await ref.read(expenseServicesProvider).deleteExpense(id);
  }
}
