import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/style/colors.dart';
import 'package:trackizer/core/style/fonts.dart';
import 'package:trackizer/widgets/text_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/Frame.png",
                    width: 22.97.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    "TRACKIZER",
                    style: AppFont.H5(context, ColorsApp.whiteapp),
                  ),
                ],
              ),
              SizedBox(height: 165.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-mail address",
                    style: AppFont.bodymeduim(context, ColorsApp.titleapp),
                  ),
                  SizedBox(height: 5.h),
                  TextForm(),
                  SizedBox(height: 16.h),
                  Text(
                    "Password",
                    style: AppFont.bodymeduim(context, ColorsApp.titleapp),
                  ),
                  SizedBox(height: 5.h),
                  TextForm(),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 5.h,
                        width: 79.w,
                        decoration: BoxDecoration(
                          color: ColorsApp.cardcolor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9.r),
                            bottomLeft: Radius.circular(9.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Container(
                        height: 5.h,
                        width: 79.w,
                        color: ColorsApp.cardcolor,
                      ),
                      SizedBox(width: 3.w),
                      Container(
                        height: 5.h,
                        width: 79.w,
                        color: ColorsApp.cardcolor,
                      ),
                      SizedBox(width: 3.w),
                      Container(
                        height: 5.h,
                        width: 79.w,
                        decoration: BoxDecoration(
                          color: ColorsApp.cardcolor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(9.r),
                            bottomRight: Radius.circular(9.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Use 8 or more characters with a mix of letters,\nnumbers & symbols.",
                    style: AppFont.bodysmall(
                      context,
                      Color(0xff666680),
                    ).copyWith(height: 1.5.h),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    height: 48.h,
                    width: 324.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(
                        color: ColorsApp.rangeColor,
                        width: 1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsApp.orangapp.withOpacity(0.6),
                          blurRadius: 25,
                          spreadRadius: 1,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.orangapp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Get started, it's free!",
                        style: AppFont.H2(context, ColorsApp.whiteapp),
                      ),
                    ),
                  ),
                  SizedBox(height: 120.h),
                  Center(
                    child: Text(
                      "Do you have already an account?",
                      style: AppFont.bodymeduim(context, ColorsApp.whiteapp),
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Container(
                    height: 48.h,
                    width: 324.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(color: ColorsApp.textapp, width: 1.w),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.cardcolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: AppFont.H2(context, ColorsApp.whiteapp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
