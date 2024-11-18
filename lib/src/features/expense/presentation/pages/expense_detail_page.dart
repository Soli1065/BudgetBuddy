import 'package:flutter/material.dart';

import '../../data/models/expense.dart';

class ExpenseDetailPage extends StatelessWidget {
  final Expense expense;

  ExpenseDetailPage({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Detail'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category: ${expense.category}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8),
            Text('Amount: ${expense.currency} ${expense.amount}'),
            SizedBox(height: 8),
            Text('Date: ${expense.date.toLocal()}'),
            SizedBox(height: 8),
            Text('Description: ${expense.description}'),
            SizedBox(height: 16),
            if (expense.receiptImagePath != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Receipt:', style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 8),
                  Image.network(expense.receiptImagePath!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
