import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_data_model.dart';

final dashboardServiceProvider = Provider<DashboardService>((ref) {
  return DashboardService();
});

class DashboardService {
  Future<DashboardDataModel> getDashboardData() async {
    // Currently unused, but this would typically call an API or database
    throw UnimplementedError();
  }
}
