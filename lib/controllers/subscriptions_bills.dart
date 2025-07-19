import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/model/SubscriptionItemModel.dart';

class SubscriptionsBills {
  List<SubscriptionItemModel> getSubscriptions() {
    return [
      SubscriptionItemModel(
        name: "Spotify",
        price: "5.99 SP",
        imagePath: ImagePaths.spotify,
      ),
      SubscriptionItemModel(
        name: "YouTube Premium",
        price: "18.99 SP",
        imagePath: ImagePaths.youtube,
      ),
      SubscriptionItemModel(
        name: "Microsoft OneDrive",
        price: "29.99 SP",
        imagePath: ImagePaths.onedrive,
      ),
      SubscriptionItemModel(
        name: "Netflix",
        price: "37.99 SP",
        imagePath: ImagePaths.netflix,
      ),
      SubscriptionItemModel(
        name: "Spotify",
        price: "5.99 SP",
        imagePath: ImagePaths.spotify,
      ),
      SubscriptionItemModel(
        name: "YouTube Premium",
        price: "18.99 SP",
        imagePath: ImagePaths.youtube,
      ),
      SubscriptionItemModel(
        name: "Microsoft OneDrive",
        price: "29.99 SP",
        imagePath: ImagePaths.onedrive,
      ),
      SubscriptionItemModel(
        name: "Netflix",
        price: "37.99 SP",
        imagePath: ImagePaths.netflix,
      ),
    ];
  }
}
