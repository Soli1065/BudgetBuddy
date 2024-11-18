import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense.dart';
import '../repositories/expense_repository.dart';

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier(ref);
});

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  final Ref ref;

  ExpenseNotifier(this.ref) : super([]);

  Future<void> fetchExpenses() async {
    final expenses = await ref.read(expenseRepositoryProvider).getAllExpenses();
    state = expenses;
  }

  Future<void> addExpense(Expense expense) async {
    await ref.read(expenseRepositoryProvider).addExpense(expense);
    state = [...state, expense];
  }

  Future<void> removeExpense(String id) async {
    await ref.read(expenseRepositoryProvider).removeExpense(id);
    state = state.where((expense) => expense.id != id).toList();
  }
}
