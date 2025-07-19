import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/controllers/subscription_controller.dart';
import 'package:trackizer/core/style/colors.dart';
import 'package:trackizer/core/style/fonts.dart';
import 'package:trackizer/models/subscription_model.dart';
import 'package:trackizer/widgets/icon_button.dart';
import 'package:trackizer/widgets/orange_button.dart';
import 'package:trackizer/widgets/text_form.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final model = widget.model;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 476.h,
                decoration: BoxDecoration(
                  color: ColorsApp.cardcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
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
                                onPressed: () => Navigator.pop(context),
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
                      SizedBox(
                        height: 220.h,
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: model.imgList.length,
                          itemBuilder: (context, index) {
                            final isCurrent =
                                index == controller.currentPage.round();
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
                                        borderRadius: BorderRadius.circular(
                                          48.r,
                                        ),
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
                    ],
                  ),
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
                    TextForm(),
                    SizedBox(height: 51.h),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButtonContainer(icon: Icons.remove),
                          SizedBox(width: 35.w),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Monthly price",
                                style: AppFont.H1(context, ColorsApp.titleapp),
                              ),
                              SizedBox(height: 6.h),
                              SizedBox(
                                width: 162.w,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "        5.99 SP",
                                    hintStyle: AppFont.H5(
                                      context,
                                      ColorsApp.whiteapp,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorsApp.cardcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30.w),
                          IconButtonContainer(icon: Icons.add),
                        ],
                      ),
                    ),
                    SizedBox(height: 55.h),
                    CustomElevatedButton(
                      text: "Add this platform",
                      onPressed: () {},
                      colorbutton: ColorsApp.orangapp,
                      height: 48.h,
                      width: 324.w,
                      colorborder: ColorsApp.rangeColor,
                      widthborder: 1.w,
                      style: AppFont.H2(context, ColorsApp.whiteapp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
