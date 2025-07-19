import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/pages/signin.dart';
import 'package:trackizer/views/widgets/bottom_navigatiobar_page.dart';
import 'package:trackizer/views/widgets/simple_step_progress_bar.dart';
import 'package:trackizer/views/widgets/text_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ColorsApp.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              right: 25.w,
              left: 25.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: Image.asset(
                    ImagePaths.logo,
                    width: 146.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 160.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "E-mail address",
                    style: AppFont.bodysmall(context, ColorsApp.textapp),
                  ),
                ),
                SizedBox(height: 10.h),
                const TextForm(),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Password",
                    style: AppFont.bodysmall(context, ColorsApp.textapp),
                  ),
                ),
                SizedBox(height: 10.h),
                const TextForm(),
                SizedBox(height: 24.h),
                const SimpleStepProgressBar(),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Use 8 or more characters with a mix of letters, numbers & symbols.",
                  style: AppFont.bodysmall(context, ColorsApp.textapp),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomElevatedButton(
                  text: "Get Started,it\'s free!",
                  colorbutton: ColorsApp.orangapp,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationBarPage(),
                      ),
                    );
                  },
                  height: 48.h,
                  width: 324.w,
                  colorborder: ColorsApp.bordercolororange,
                  widthborder: 1.w,
                  style: AppFont.H2(context,ColorsApp.whiteapp),
                ),
                SizedBox(
                  height: 115.h,
                ),
                Text(
                  "Do you have already an account?",
                  style: AppFont.bodymeduim(context, ColorsApp.whiteapp),
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  text: "Sign In",
                  colorbutton: ColorsApp.buttonapp,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                  height: 48.h,
                  width: 324.w,
                  colorborder: ColorsApp.bordercolorgrey,
                  widthborder: 1.w,
                  style: AppFont.H2(context,ColorsApp.whiteapp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
