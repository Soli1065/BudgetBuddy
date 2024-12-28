import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/dashboard_data_model.dart';
import '../../data/providers/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardProvider);

    return dashboardState.when(
      data: (data) => _buildDashboardContent(data),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildDashboardContent(DashboardDataModel data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Balance: \$${data.totalBalance}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Total Expenses: \$${data.totalExpenses}', style: const TextStyle(fontSize: 18)),
          Text('Total Income: \$${data.totalIncome}', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          const Text('Expense Breakdown:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildExpenseSummary(data.expenseSummaries),
          const SizedBox(height: 16),
          const Text('Recent Transactions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildRecentTransactions(data.recentTransactions),
        ],
      ),
    );
  }

  Widget _buildExpenseSummary(List<ExpenseCategorySummary> summaries) {
    return Column(
      children: summaries
          .map(
            (summary) => Card(
          color: Color(int.parse('0xFF${summary.color.substring(1)}')),
          child: ListTile(
            title: Text(summary.category, style: const TextStyle(color: Colors.white)),
            trailing: Text('\$${summary.amount}', style: const TextStyle(color: Colors.white)),
          ),
        ),
      )
          .toList(),
    );
  }

  Widget _buildRecentTransactions(List<Transaction> transactions) {
    return Column(
      children: transactions
          .map(
            (transaction) => ListTile(
          title: Text(transaction.title),
          subtitle: Text(transaction.date.toString()),
          trailing: Text('\$${transaction.amount}'),
        ),
      )
          .toList(),
    );
  }
}
