import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/model/SubscriptionItemModel.dart';

class UpcomingBills {
  List<SubscriptionItemModel> getUpcomingBills() {
    return [
      SubscriptionItemModel(
        name: "Spotify",
        price: "5.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "YouTube Premium",
        price: "18.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "Microsoft OneDrive",
        price: "29.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "Netflix",
        price: "37.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "Spotify",
        price: "5.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "YouTube Premium",
        price: "18.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "Microsoft OneDrive",
        price: "29.99 SP",
        imagePath: ImagePaths.date,
      ),
      SubscriptionItemModel(
        name: "Netflix",
        price: "37.99 SP",
        imagePath: ImagePaths.date,
      ),
    ];
  }
}
