import '../core/ButtonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/Custom_TextFormField.dart';
import '../core/colors.dart';
import '../core/fonts.dart';
import 'Credit_Cards.dart';

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
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: GestureDetector(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset("assets/images/logo.png", width: 146.w),
              ),
              SizedBox(height: 200.h),

              Text(
                "Login",
                style: GoogleFonts.inter(
                  color: ColorsApp.titlecard,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextFormFieldyWidget(
                controller: emailController,
                obscure: false,
                keyboardtype: TextInputType.emailAddress,
                size: 14,
                borderRadius: 20,
              ),
              SizedBox(height: 24.h),
              Text(
                "Password",
                style: GoogleFonts.inter(
                  color: ColorsApp.titlecard,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextFormFieldyWidget(
                controller: passwordController,
                obscure: true,
                keyboardtype: TextInputType.visiblePassword,
                size: 14,
                borderRadius: 20,
              ),

              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password",
                      style: GoogleFonts.inter(
                        color: ColorsApp.titlecard,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),
              Center(
                child: CustomElevatedButton(
                  text: "Sgin In",
                  sizetext: 14,
                  colortext: ColorsApp.white70,
                  color: ColorsApp.orangapp,
                  colorborder: ColorsApp.orangapp,
                  onPressed: () {},
                  height: 48.h,
                  width: 324.w,
                  widthborder: 0,
                ),
              ),

              SizedBox(height: 150.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      "If you don't have an account yet?",
                      style: GoogleFonts.inter(
                        color: ColorsApp.whiteapp,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomElevatedButton(
                      text: "Sgin Up",
                      sizetext: 14,
                      colortext: ColorsApp.white70,
                      color: ColorsApp.buttonapp,
                      colorborder: ColorsApp.buttonapp,
                      onPressed: () {},
                      height: 48.h,
                      width: 324.w,
                      widthborder: 0,
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
