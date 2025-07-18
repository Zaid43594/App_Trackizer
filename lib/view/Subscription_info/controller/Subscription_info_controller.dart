class SubscriptionController {
  String name = "Spotify";
  String description = "Music app";
  String category = "Entertainment";
  DateTime firstPayment = DateTime(2022, 1, 8);
  String reminder = "Never";
  String currency = "Syrian Pound (SP)";
  double price = 5.99;

  void updateName(String newName) {
    name = newName;
  }

  void updateDescription(String newDescription) {
    description = newDescription;
  }

  void updateCategory(String newCategory) {
    category = newCategory;
  }

  void updateFirstPayment(DateTime date) {
    firstPayment = date;
  }

  void updateReminder(String newReminder) {
    reminder = newReminder;
  }

  void updateCurrency(String newCurrency) {
    currency = newCurrency;
  }

  void updatePrice(double newPrice) {
    price = newPrice;
  }
}
