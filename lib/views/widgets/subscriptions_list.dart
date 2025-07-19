import 'package:flutter/material.dart';
import 'package:trackizer/controllers/subscriptions_bills.dart';
import 'package:trackizer/views/pages/Subscription_info_screen.dart';
import 'package:trackizer/views/widgets/subscription_item.dart';

class SubscriptionsList extends StatelessWidget {
  final SubscriptionsBills controller = SubscriptionsBills();

  SubscriptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscriptions = controller.getSubscriptions();

    return ListView.builder(
      itemCount: subscriptions.length,
      itemBuilder: (context, index) {
        final sub = subscriptions[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SubscriptionScreen(),
              ),
            );
          },
          child: SubscriptionItem(
            name: sub.name,
            price: sub.price,
            imagePath: sub.imagePath,
          ),
        );
      },
    );
  }
}
