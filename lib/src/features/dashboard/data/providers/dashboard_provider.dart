import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/dashboard_data_model.dart';
import '../repositories/dashboard_repository.dart';

final dashboardProvider = StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardDataModel>>((ref) {
  return DashboardNotifier(ref.read(dashboardRepositoryProvider));
});

class DashboardNotifier extends StateNotifier<AsyncValue<DashboardDataModel>> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const AsyncLoading()) {
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    try {
      final data = await _repository.fetchDashboardData();
      state = AsyncData(data);
    } catch (error,s) {
      state = AsyncError(error,s);
    }
  }



  /// Fetches dashboard summary and updates the state.
  Future<void> loadDashboardSummary() async {
    state = const AsyncValue.loading();
    final result = await _repository.getDashboardSummary();

    // result.when(
    //   success: (data) => state = AsyncValue.data(data),
    //   failure: (error) => state = AsyncValue.error(error),
    // );
  }


}
