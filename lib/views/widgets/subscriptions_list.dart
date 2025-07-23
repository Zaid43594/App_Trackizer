import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/subscriptions_bills.dart';
import 'package:trackizer/views/pages/Subscription_info_screen.dart';
import 'package:trackizer/views/widgets/subscription_item.dart';

class SubscriptionsList extends StatelessWidget {
  final SubscriptionsBills controller = SubscriptionsBills();

  SubscriptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptions = controller.getSubscriptions();

    return Padding(
      // padding: EdgeInsets.symmetric(
      //   horizontal: 8.w,
      // ),
      padding: EdgeInsets.only(
        right: 8.w,
        left: 8.w,
        bottom: 10.h,
      ),
      child: SizedBox(
        height: 300,
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
