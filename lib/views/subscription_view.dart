import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/subscription_controller.dart';
import 'package:trackizer/core/style/colors.dart';
import 'package:trackizer/core/style/fonts.dart';
import 'package:trackizer/models/subscription_model.dart';

class NewSubscriptionView extends StatefulWidget {
  final NewSubscriptionController controller;
  final SubscriptionModel model;

  const NewSubscriptionView({
    super.key,
    required this.controller,
    required this.model,
  });

  @override
  State<NewSubscriptionView> createState() => _NewSubscriptionViewState();
}

class _NewSubscriptionViewState extends State<NewSubscriptionView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addPageListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final model = widget.model;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsApp.background,
      body: Stack(
        children: [
          Container(
            width: 375.w,
            height: 476.h,
            decoration: BoxDecoration(
              color: ColorsApp.cardcolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 56.h,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    "spending & budget",
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorsApp.titleapp,
                                  size: 24.w,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "New",
                                style: AppFont.BodyLarge(
                                  context,
                                  ColorsApp.titleapp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: Text(
                          "Add new\nsubscription",
                          style: TextStyle(
                            height: 1,
                            fontFamily: 'Inter',
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.whiteapp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),

                SizedBox(
                  height: 220.h,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: model.imgList.length,
                    itemBuilder: (context, index) {
                      final isCurrent = index == controller.currentPage.round();
                      final scale = isCurrent ? 1.0 : 0.85;

                      return AnimatedScale(
                        scale: scale,
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 161.h,
                                width: 161.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48.r),
                                  color: Colors.white10,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  model.imgList[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 23.h),
                              Text(
                                model.nameList[index],
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsApp.whiteapp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 24.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Text(
                        "Description",
                        style: AppFont.bodymeduim(context, ColorsApp.titleapp),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 48.h,
                        width: 327.w,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            color: ColorsApp.whiteapp,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                color: ColorsApp.cardcolor,
                                width: 1.5.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                color: ColorsApp.cardcolor,
                                width: 2.w,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 51.h),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              height: 48.h,
                              width: 48.w,
                              decoration: BoxDecoration(
                                color: ColorsApp.cardcolor,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border(
                                  left: BorderSide(
                                    color: ColorsApp.textapp,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: const Color(0xFF4E4E61),
                                size: 24,
                              ),
                            ),
                          ),
                          SizedBox(width: 40.w),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "Monthly price",
                                  style: AppFont.H1(
                                    context,
                                    ColorsApp.titleapp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "5.99 SP",
                                  style: AppFont.H5(
                                    context,
                                    ColorsApp.whiteapp,
                                  ),
                                ),
                                SizedBox(height: 10.h),

                                Container(
                                  height: 1.h,
                                  width: 155.w,
                                  color: ColorsApp.cardcolor,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            child: Container(
                              height: 48.h,
                              width: 48.w,
                              decoration: BoxDecoration(
                                color: ColorsApp.cardcolor,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border(
                                  left: BorderSide(
                                    color: ColorsApp.textapp,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: const Color(0xFF4E4E61),
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 55.h),

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
                            "Add this platform",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
