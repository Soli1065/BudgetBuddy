/// A centralized class to manage all API endpoint URLs.
/// This helps in avoiding hardcoding URLs across the app, making updates easier.
class ApiEndpoints {
  // Base URL for the API
  static const String baseUrl = "https://api.example.com";

  // Authentication endpoints
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String refreshToken = "$baseUrl/auth/refresh-token";

  // Expense feature endpoints
  static const String getExpenses = "$baseUrl/expenses";
  static const String addExpense = "$baseUrl/expenses/add";
  static const String updateExpense = "$baseUrl/expenses/update";
  static const String deleteExpense = "$baseUrl/expenses/delete";

  // Dashboard feature endpoints
  static const String dashboardSummary = "$baseUrl/dashboard/summary";
  static const String dashboardCharts = "$baseUrl/dashboard/charts";

// Additional endpoints can be added here as needed
}
