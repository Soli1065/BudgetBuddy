class Expense {
  final String id; // Unique identifier for the expense
  final double amount; // The total amount of the expense
  final String category; // Category for the expense (e.g., "Food", "Transport")
  final DateTime date; // Date the expense occurred
  final String description; // Description or notes about the expense
  final String paymentMethod; // Payment method (Cash, Credit Card, etc.)
  final String currency; // Currency of the expense (e.g., USD, EUR)
  final String? location; // Optional location where the expense was made (e.g., store name or city)
  final bool isRecurring; // Whether the expense is recurring
  final String? recurrenceFrequency; // Frequency of recurring expense (e.g., Monthly, Annually)
  final List<String> tags; // Tags to categorize the expense (e.g., "Business", "Travel")
  final String? source; // Source of the expense (e.g., "Bank Account", "Mobile Wallet", etc.)
  final String? groupId; // Grouping related expenses together (e.g., Business Trip)
  final String? receiptImagePath; // Path or URL for the receipt image (null if no receipt)

  Expense({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
    required this.paymentMethod,
    required this.currency,
    this.location,
    this.isRecurring = false,
    this.recurrenceFrequency,
    this.tags = const [],
    this.source,
    this.groupId,
    this.receiptImagePath, // Initialize the receipt image path
  });

  // You could add a method to handle formatting for the display of expenses (e.g., currency formatting)
  String getFormattedAmount() {
    return '$currency $amount';
  }

// You can add methods for recurring logic or other specific actions as needed
}
