import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/colors.dart';
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
            children: [
              Center(child: Image.asset("assets/images/logo.png", width: 146.w)),
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

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: GoogleFonts.inter(fontSize: 14.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
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

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: GoogleFonts.inter(fontSize: 14.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
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
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorsApp.orangapp,
                        spreadRadius: 2.r,
                        blurRadius: 25.r,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 324.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.orangapp,
                        foregroundColor: ColorsApp.whiteapp,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.inter(
                          color: ColorsApp.whiteapp,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999.r),
                      child: SizedBox(
                        width: 324.w,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CreditCardScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.boxcolor,
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.inter(
                              color: ColorsApp.whiteapp,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),

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
      ),
    );
  }
}
