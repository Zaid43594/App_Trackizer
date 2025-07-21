import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/model/row_info.dart';
import 'package:trackizer/model/subscription_info_model.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';

import '../../controllers/Subscription_info_controller.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final SubscriptionInfo subscription = SubscriptionController().subscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.blackapp,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0.w),
          child: Stack(
            children: [
              Column(
                children: [
                  buildTopContainer(),
                  buildBottomContainer(context),
                ],
              ),
              Positioned(
                top: 314.h,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 40.h,
                  child: CustomPaint(
                    painter: DottedLinePainter(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopContainer() {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.navbackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 32.h),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    ImagePaths.arrow,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  'Subscription info',
                  style: GoogleFonts.inter(
                    color: ColorsApp.titleapp,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Image.asset(
                  ImagePaths.trash,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Image.asset(
              ImagePaths.spotify,
              width: 106.w,
              height: 106.h,
            ),
            SizedBox(height: 16.h),
            Text(
              subscription.name,
              style: AppFont.H6(
                context,
                ColorsApp.whiteapp,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "${subscription.price} SP",
              style: AppFont.H4(
                context,
                ColorsApp.titleapp,
              ),
            ),
            SizedBox(
              height: 27.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsApp.backgroundsub,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Color(0xff30303C),
              borderRadius: BorderRadius.circular(16.r),
              border: Border(
                left: BorderSide(
                  color: ColorsApp.textapp,
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRow(
                    title: 'Name',
                    value: subscription.name,
                    onTap: () {},
                  ),
                  InfoRow(
                    title: 'Description',
                    value: subscription.description,
                    onTap: () {},
                  ),
                  InfoRow(
                    title: 'Category',
                    value: subscription.category,
                    onTap: () {},
                  ),
                  InfoRow(
                    title: 'First payment',
                    value: subscription.firstPayment,
                    onTap: () {},
                  ),
                  InfoRow(
                    title: 'Reminder',
                    value: subscription.reminder,
                    onTap: () {},
                  ),
                  InfoRow(
                    title: 'Currency',
                    value: subscription.currency,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32.h),
          CustomElevatedButton(
            text: "Save",
            colorbutton: ColorsApp.buttonapp,
            onPressed: () {},
            height: 48.h,
            width: 288.w,
            colorborder: ColorsApp.bordercolorgrey,
            widthborder: 1.w,
            style: AppFont.H2(
              context,
              ColorsApp.whiteapp,
            ),
            hasLeft: true,
            hasRight: false,
            hasTop: true,
            hasBottom: false,
          )

        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF131318)
      ..strokeWidth = 3.5;

    double dashWidth = 7;
    double dashSpace = 12;
    double startX = 0;
    final centerY = size.height / 2;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, centerY),
        Offset(startX + dashWidth, centerY),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    final circleRadius = 13.5;
    canvas.drawCircle(Offset(0, centerY), circleRadius, paint);
    canvas.drawCircle(Offset(size.width, centerY), circleRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
