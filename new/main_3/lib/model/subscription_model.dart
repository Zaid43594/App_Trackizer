

class SubscriptionModel {
  final String image;
  final String name;
  final double price;
  final String? description;

  SubscriptionModel({
    required this.image,
    required this.name,
    required this.price,
    this.description,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      image: json['image'],
      name: json['name'],
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'],
    );
  }
}
