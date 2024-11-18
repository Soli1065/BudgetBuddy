import 'package:budget_buddy/src/features/expense/presentation/pages/add_expense_page.dart';
import 'package:budget_buddy/src/features/expense/presentation/pages/expense_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/expense_provider.dart';

class ExpenseListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: expenses.isEmpty
          ? Center(
        child: Text(
          'No expenses added yet!',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
          : ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return ListTile(
            title: Text(
              expense.category,
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            subtitle: Text('${expense.currency} ${expense.amount}'),
            trailing: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColorLight),
            onTap: () {
              // Navigator.pushNamed(context, '/expense/detail', arguments: expense);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpenseDetailPage(expense: expense)));

            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pushNamed(context, '/expense/add'),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AddExpensePage())),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
