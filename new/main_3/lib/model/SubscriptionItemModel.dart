import 'package:trackizer/core/constants/image_paths.dart';

class SubscriptionItemModel {
  final String name;
  final String price;
  final String imagePath;

  SubscriptionItemModel({
    required this.name,
    required this.price,
    required this.imagePath,
  });

  factory SubscriptionItemModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? '';
    final price = json['price']?.toString() ?? '';
    final imagePath = subscriptionImages[name] ?? '';

    return SubscriptionItemModel(
      name: name,
      price: price,
      imagePath: imagePath,
    );
  }
}

const Map<String, String> subscriptionImages = {
  'YouTube Premium': ImagePaths.youtube,
  'proton vpn Premium': ImagePaths.youtube,
  'YouTube': ImagePaths.youtube,
  'Netflix Standard': ImagePaths.netflix,
  'Netflix': ImagePaths.netflix,
  'Spotify Family': ImagePaths.spotify,
  'Apple TV': ImagePaths.netflix,
  'HBBO GO': ImagePaths.hbogo,
  'Disney+': ImagePaths.onedrive,
};
