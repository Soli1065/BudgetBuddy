import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_data_model.dart';
import '../services/dashboard_service.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.read(dashboardServiceProvider));
});

class DashboardRepository {
  final DashboardService _service;

  DashboardRepository(this._service);

  Future<DashboardDataModel> fetchDashboardData() async {
    // Mocking data for now
    await Future.delayed(const Duration(seconds: 1)); // Simulating network delay
    return DashboardDataModel(
      totalBalance: 2500.0,
      totalExpenses: 1200.0,
      totalIncome: 3700.0,
      expenseSummaries: [
        ExpenseCategorySummary(category: 'Food', amount: 500.0, color: '#FF6384'),
        ExpenseCategorySummary(category: 'Rent', amount: 400.0, color: '#36A2EB'),
        ExpenseCategorySummary(category: 'Utilities', amount: 300.0, color: '#FFCE56'),
      ],
      recentTransactions: [
        Transaction(id: '1', title: 'Grocery Shopping', amount: 150.0, date: DateTime.now()),
        Transaction(id: '2', title: 'Electricity Bill', amount: 100.0, date: DateTime.now().subtract(const Duration(days: 1))),
        Transaction(id: '3', title: 'Netflix Subscription', amount: 20.0, date: DateTime.now().subtract(const Duration(days: 2))),
      ],
    );
  }
}
