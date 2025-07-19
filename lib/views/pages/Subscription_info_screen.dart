import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/Subscription_info_controller.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';

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
            child: ListView(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: buildSubscriptionContent()),
              ],
            ),
          ),
          Positioned(
            top: 310.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset(
                ImagePaths.divider,
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
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorsApp.titleapp,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Subscription info',
                      style: GoogleFonts.inter(
                        color: ColorsApp.titleapp,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.delete_outline,
                        color: ColorsApp.titleapp, size: 24.sp),
                  ],
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  ImagePaths.spotify,
                  width: 106.w,
                  height: 106.h,
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
              // SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorsApp.cardcolor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    buildInfoItem("Name", controller.name),
                    buildInfoItem("Description", controller.description),
                    buildInfoItem("Category", controller.category),
                    buildInfoItem(
                        "First payment",
                        DateFormat('dd.MM.yyyy')
                            .format(controller.firstPayment)),
                    buildInfoItem("Reminder", controller.reminder),
                    buildInfoItem("Currency", controller.currency),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                text: "Save",
                colorbutton: ColorsApp.bottomcolor,
                onPressed: () {},
                height: 48.h,
                width: 288.w,
   
                colorborder: ColorsApp.bordercolorgrey,
                widthborder: 2.w, style: AppFont.H2(context,ColorsApp.whiteapp),
              )
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
