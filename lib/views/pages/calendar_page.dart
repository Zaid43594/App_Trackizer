import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/calendar_controller.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/views/pages/settings_screen.dart';
import 'package:trackizer/views/widgets/day_item.dart';
import 'package:trackizer/views/widgets/subscription_card.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CalendarController();
    final days = controller.getDays();
    final subscriptions = controller.getSubscriptions();

    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          _buildHeader(context, controller, days),
          _buildMonthSummary(),
          // SizedBox(height: 8.h),
          _buildSubscriptionsList(subscriptions),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    CalendarController controller,
    List days,
  ) {
    return Card(
      elevation: 0,
      color: const Color(0xFF353542),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Container(
        height: 0.43.sh,
        padding: EdgeInsets.only(left: 16.w, right: 8, top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            Text('Subs\nSchedule',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                )),
            SizedBox(height: 12.h),
            _buildSubHeader(controller),
            SizedBox(height: 10.h),
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) => DayItem(item: days[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 125.w),
        Text(
          'Calendar',
          style: TextStyle(
            color: ColorsApp.greyapp,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          width: 100.w,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          icon: const Icon(Icons.settings_outlined),
          color: ColorsApp.titleapp,
          iconSize: 24.sp,
        ),
      ],
    );
  }

  Widget _buildSubHeader(CalendarController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('3 subscriptions for today',
            style: TextStyle(color: Colors.grey[400], fontSize: 14.sp)),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2E),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: 'January',
              dropdownColor: ColorsApp.cardcolor,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
              items: controller.getMonths().map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMonthSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("January",
                  style: TextStyle(fontSize: 20.sp, color: ColorsApp.whiteapp)),
              Text("24,98 SP",
                  style: TextStyle(fontSize: 20.sp, color: ColorsApp.whiteapp)),
            ],
          ),
          // SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("01.08.2022",
                  style: TextStyle(fontSize: 12.sp, color: ColorsApp.greyapp)),
              Text("in upcoming bills",
                  style: TextStyle(fontSize: 12.sp, color: ColorsApp.greyapp)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionsList(List subscriptions) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: subscriptions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            final item = subscriptions[index];
            return SubscriptionCard(
              name: item['name'],
              price: item['price'],
              imagePath: item['image'],
            );
          },
        ),
      ),
    );
  }
}
