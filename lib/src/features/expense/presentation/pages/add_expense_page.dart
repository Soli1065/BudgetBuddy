import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/expense.dart';
import '../../data/providers/expense_provider.dart';

class AddExpensePage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseNotifier = ref.watch(expenseProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) => value?.isEmpty == true ? 'Enter a category' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
                validator: (value) => value?.isEmpty == true ? 'Enter an amount' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) => value?.isEmpty == true ? 'Enter a description' : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    final newExpense = Expense(
                      id: DateTime.now().toString(),
                      category: _categoryController.text,
                      amount: double.parse(_amountController.text),
                      date: DateTime.now(),
                      description: _descriptionController.text,
                      paymentMethod: 'Cash',
                      currency: 'USD',
                    );
                    expenseNotifier.addExpense(newExpense);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Expense'),
                // style: ElevatedButton.styleFrom(
                  // primary: Theme.of(context).primaryColor,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
