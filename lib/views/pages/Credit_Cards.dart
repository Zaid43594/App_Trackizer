import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/pages/settings_screen.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: ColorsApp.background,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Credit Cards",
            style: GoogleFonts.inter(
              color: ColorsApp.titleapp,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
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
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    ImagePaths.creditcard,
                    width: 285.w,
                    height: 377.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // SizedBox(height: 25.h),
              Text(
                "Subscriptions",
                style: GoogleFonts.inter(
                  color: ColorsApp.whiteapp,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImagePaths.spotify, height: 40.h),
                  SizedBox(width: 9.w),
                  Image.asset(ImagePaths.youtube, height: 40.h),
                  SizedBox(width: 9.w),
                  Image.asset(ImagePaths.onedrive, height: 40.h),
                  SizedBox(width: 9.w),
                  Image.asset(ImagePaths.netflix, height: 40.h),
                ],
              ),
              // SizedBox(height: 10.h),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: MediaQuery.of(context).size.width,
              height: 185.h,
              decoration: BoxDecoration(
                color: ColorsApp.boxcolor.withAlpha(127),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // print('Add new card pressed!');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 85.h),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      color: ColorsApp.white70,
                      strokeWidth: 1,
                      dashPattern: [6, 3],
                      child: Container(
                        width: 328.w,
                        height: 52.h,
                        alignment: Alignment.center,
                        child: Text(
                          "Add new card +",
                          style: GoogleFonts.inter(
                            color: ColorsApp.white70,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
