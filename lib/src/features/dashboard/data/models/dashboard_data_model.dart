class DashboardDataModel {
  final double totalBalance;
  final double totalExpenses;
  final double totalIncome;
  final List<ExpenseCategorySummary> expenseSummaries; // Breakdown of expenses by category
  final List<Transaction> recentTransactions;         // Recent transactions for the dashboard

  DashboardDataModel({
    required this.totalBalance,
    required this.totalExpenses,
    required this.totalIncome,
    required this.expenseSummaries,
    required this.recentTransactions,
  });
}

class ExpenseCategorySummary {
  final String category;
  final double amount;
  final String color; // Hex color code for visual representation (e.g., charts)

  ExpenseCategorySummary({
    required this.category,
    required this.amount,
    required this.color,
  });
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
