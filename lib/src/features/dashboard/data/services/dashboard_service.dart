import 'package:budget_buddy/src/network/api_endpoints.dart';
import 'package:budget_buddy/src/network/api_result.dart';
import 'package:budget_buddy/src/network/network_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashboard_data_model.dart';

final dashboardServiceProvider = Provider<DashboardService>((ref) {
  final networkHelper = ref.watch(networkHelperProvider);
  return DashboardService(networkHelper: networkHelper);
});

class DashboardService {


  final NetworkHelper networkHelper;

  DashboardService({required this.networkHelper});


  Future<DashboardDataModel> getDashboardData() async {
    // Currently unused, but this would typically call an API or database
    throw UnimplementedError();
  }

  Future<ApiResult<Map<String, dynamic>>> getDashboardSummery() async {
    return await networkHelper.get(ApiEndpoints.getExpenses);
  }
}
