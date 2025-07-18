import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/colors.dart';
import '../../setting/screen/setting.dart';
import '../controller/Subscription_info_controller.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final SubscriptionController controller = SubscriptionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blackapp,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: buildSubscriptionContent()),
              ],
            ),
          ),
          Positioned(
            top: 290.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset(
                'assets/images/Divider.png',
                height: 27.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget buildSubscriptionContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ===== الكونتينر العلوي =====
        Container(
          decoration: BoxDecoration(
            color: ColorsApp.cardcolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.keyboard_arrow_down, color: ColorsApp.titleapp, size: 24.sp),
                    Text(
                      'Subscription info',
                      style: GoogleFonts.inter(
                        color: ColorsApp.titleapp,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.delete_outline, color: ColorsApp.titleapp, size: 24.sp),
                  ],
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  'assets/images/Spotify Logo.png',
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                Text(
                  controller.name,
                  style: GoogleFonts.inter(
                    color: ColorsApp.whiteapp,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //SizedBox(height: 2.h),
                Text(
                  "${controller.price.toStringAsFixed(2)} SP",
                  style: GoogleFonts.inter(
                    color: ColorsApp.titleapp,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        // ===== الكونتينر السفلي =====
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsApp.boxcolor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: ColorsApp.cardcolor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    buildInfoItem("Name", controller.name),
                    buildInfoItem("Description", controller.description),
                    buildInfoItem("Category", controller.category),
                    buildInfoItem("First payment", DateFormat('dd.MM.yyyy').format(controller.firstPayment)),
                    buildInfoItem("Reminder", controller.reminder),
                    buildInfoItem("Currency", controller.currency),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.buttonapp,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  minimumSize: Size(double.infinity, 50.h),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SettingsScreen()),
                  );
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.inter(color: ColorsApp.whiteapp, fontSize: 16.sp),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  Widget buildInfoItem(String title, String value) {
    return InkWell(
      onTap: () {
        print("Tapped on $title");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: ColorsApp.whiteapp,
                fontSize: 14.sp,
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: GoogleFonts.inter(
                    color: ColorsApp.white70,
                    fontSize: 14.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("Pressed arrow on $title");
                  },
                  icon: Icon(
                    Icons.chevron_right,
                    color: ColorsApp.white70,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
