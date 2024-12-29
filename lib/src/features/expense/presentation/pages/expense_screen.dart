import 'package:budget_buddy/src/features/expense/presentation/pages/add_expense_page.dart';
import 'package:budget_buddy/src/features/expense/presentation/pages/expense_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/expense_provider.dart';

class ExpenseScreen extends ConsumerWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);

    return Scaffold(
      body: Column(
        children: [
          // 1) Expanded Summary Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Spent This Month: \$450.00',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Transactions: ${expenses.length}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Average Daily Expense: \$15.00',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          // 2) Search Field (in place of filter/search buttons)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                hintText: 'Search expenses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                // TODO: Implement actual search logic
                // e.g., ref.read(expenseProvider.notifier).searchExpenses(value);
              },
            ),
          ),

          // 3) Expanded List of Expenses
          Expanded(
            child: expenses.isEmpty
                ? Center(
              child: Text(
                'No expenses added yet!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return _buildExpenseItem(context, expense);
              },
            ),
          ),
        ],
      ),

      // 4) Floating Action Button to Add Expense
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AddExpensePage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildExpenseItem(BuildContext context, dynamic expense) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 1,
      child: ListTile(
        leading: Icon(
          Icons.category,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          expense.category,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '${expense.currency} ${expense.amount}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpenseDetailPage(expense: expense)),
          );
        },
      ),
    );
  }
}