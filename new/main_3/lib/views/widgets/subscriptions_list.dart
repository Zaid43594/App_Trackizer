import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/subscriptions_bills.dart';
import 'package:trackizer/services/subscriptions_services.dart';
import 'package:trackizer/views/pages/Subscription_info_screen.dart';
import 'package:trackizer/views/widgets/subscription_item.dart';

class SubscriptionsList extends StatelessWidget {
  final SubscriptionsBills controller = SubscriptionsBills();

  SubscriptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: FutureBuilder<List>(
        future: fetchsubscription(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد اشتراكات'));
          }

          final subscriptions = snapshot.data!;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 12.h),
              itemCount: subscriptions.length,
              itemBuilder: (context, index) {
                final sub = subscriptions[index];
                return GestureDetector(
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
          );
        },
      ),
    );
  }
}
