class SubscriptionInfo {
  final String name;
  final String description;
  final String category;
  final String firstPayment;
  final String reminder;
  final String currency;
  final double price;

  SubscriptionInfo(  {
    required this.name,
    required this.description,
    required this.category,
    required this.firstPayment,
    required this.reminder,
    required this.currency,
    required this.price,
  });
}
