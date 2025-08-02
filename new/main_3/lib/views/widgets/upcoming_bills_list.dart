import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/upcoming_bills.dart';
import 'package:trackizer/views/widgets/subscription_item.dart';

class UpcomingBillsList extends StatelessWidget {
  final UpcomingBills controller = UpcomingBills();

  UpcomingBillsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final upcomingBills = controller.getUpcomingBills();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 12.h),
        itemCount: upcomingBills.length,
        itemBuilder: (context, index) {
          final bill = upcomingBills[index];
          return SubscriptionItem(
            name: bill.name,
            price: bill.price,
            imagePath: bill.imagePath,
          );
        },
      ),
    );
  }
}
