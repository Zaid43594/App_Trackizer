import 'package:trackizer/model/subscription_info_model.dart';

class SubscriptionController {
  SubscriptionInfo get subscription => SubscriptionInfo(
        name: 'Spotify',
        description: 'Music app',
        category: 'Entertainment',
        firstPayment: '08.01.2022',
        reminder: 'Never',
        currency: 'Syrian Pound (SP)',
        price: 5.99,
      );
}
