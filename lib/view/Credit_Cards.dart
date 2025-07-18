import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/BottomNavigationBar.dart';
import '../core/colors.dart';

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
              onPressed: () {},
              icon: const Icon(Icons.settings),
              color: ColorsApp.titleapp,
              iconSize: 20.sp,
              splashRadius: 20.r,
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
                    'assets/images/Credit Cards..png',
                    width: 280.74.w,
                    height: 377.89.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                "Subscriptions",
                style: GoogleFonts.inter(
                  color: ColorsApp.whiteapp,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Frame (4).png', height: 40.h),
                  SizedBox(width: 9.w),
                  Image.asset('assets/images/Frame (3).png', height: 40.h),
                  SizedBox(width: 9.w),
                  Image.asset('assets/images/Frame (2).png', height: 40.h),
                  SizedBox(width: 9.w),
                  Image.asset('assets/images/Frame.png', height: 40.h),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: BoxDecoration(
                color: ColorsApp.boxcolor.withAlpha(127),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print('Add new card pressed!');
                      },
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

                  // SizedBox(height: 30.h),
                  Expanded(child: CustomBottomNavWithFAB()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
