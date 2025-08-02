
import 'package:trackizer/model/SubscriptionItemModel.dart';
import 'package:trackizer/services/subscriptions_services.dart';

class SubscriptionsBills {
  Future<List<SubscriptionItemModel>> getSubscriptions() {
    return fetchsubscription();
  }
}
