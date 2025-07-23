import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/pages/register.dart';
import 'package:trackizer/views/widgets/bottom_navigatiobar_page.dart';
import 'package:trackizer/views/widgets/text_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                SizedBox(height: 180.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Login",
                    style: AppFont.bodymeduim(context, ColorsApp.titleapp),
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
                    style: AppFont.bodymeduim(context, ColorsApp.titleapp),
                  ),
                ),
                SizedBox(height: 10.h),
                const TextForm(),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                      activeColor: ColorsApp.orangapp,
                    ),
                    Text(
                      "Remember me",
                      style: GoogleFonts.inter(
                        color: ColorsApp.titlecard,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      "Forgot password",
                      style: AppFont.bodymeduim(context, ColorsApp.textapp),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomElevatedButton(
                  text: "Sigin",
                  // color: ColorsApp.orangapp,
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
                  widthborder: 1.w, style: AppFont.H2(context,ColorsApp.whiteapp),
                  hasLeft: true,
                  hasRight: false,
                  hasTop: true,
                  hasBottom: false,
                ),
                SizedBox(
                  height: 115.h,
                ),
                Text(
                  "If you don't have an account yet?",
                  style: AppFont.bodymeduim(context, ColorsApp.whiteapp),
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  text: "Sign Un",
                  colorbutton: ColorsApp.buttonapp,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  height: 48.h,
                  width: 324.w,
                  colorborder: ColorsApp.bordercolorgrey,
                  widthborder: 1.w, style: AppFont.H2(context,ColorsApp.whiteapp),
                  hasLeft: true,
                  hasRight: false,
                  hasTop: true,
                  hasBottom: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
