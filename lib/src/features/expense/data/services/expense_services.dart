import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense.dart';

// Provider for services
final expenseServicesProvider = Provider<ExpenseServices>((ref) {
  return ExpenseServices();
});

class ExpenseServices {
  // Simulated database
  final List<Expense> _expenseDatabase = [];

  // Fetch expenses from simulated database
  Future<List<Expense>> fetchExpenses() async {
    // Simulate a delay for loading
    await Future.delayed(Duration(milliseconds: 300));
    return List.from(_expenseDatabase);
  }

  // Save an expense to simulated database
  Future<void> saveExpense(Expense expense) async {
    await Future.delayed(Duration(milliseconds: 200));
    _expenseDatabase.add(expense);
  }

  // Delete an expense from simulated database
  Future<void> deleteExpense(String id) async {
    await Future.delayed(Duration(milliseconds: 200));
    _expenseDatabase.removeWhere((expense) => expense.id == id);
  }
}
