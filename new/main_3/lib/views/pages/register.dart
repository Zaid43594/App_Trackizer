import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/pages/signin.dart';
import 'package:trackizer/views/widgets/bottom_navigatiobar_page.dart';
import 'package:trackizer/views/widgets/simple_step_progress_bar.dart';
import 'package:trackizer/views/widgets/custom_textfromfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final url =
        Uri.parse('https://ftcbwmmsnykncncsyrfs.supabase.co/auth/v1/signup');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonDecode(response.body));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationBarPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${response.body}')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong.')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
            child: Form(
              key: _formKey,
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
                  CustomTextFormField(
                    controller: _emailController,
                    keyboard: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Password",
                      style: AppFont.bodysmall(context, ColorsApp.textapp),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    controller: _passwordController,
                    validator: (value) => value!.length < 8
                        ? 'Password must be at least 8 characters'
                        : null,
                  ),
                  SizedBox(height: 24.h),
                  const SimpleStepProgressBar(),
                  SizedBox(height: 16.h),
                  Text(
                    "Use 8 or more characters with a mix of letters, numbers & symbols.",
                    style: AppFont.bodysmall(context, ColorsApp.textapp),
                  ),
                  SizedBox(height: 40.h),
                  CustomElevatedButton(
                    text: _isLoading ? "Loading..." : "Get Started, it’s free!",
                    colorbutton: ColorsApp.orangapp,
                    onPressed: () {
                      if (!_isLoading) {
                        registerUser();
                      }
                    },
                    height: 48.h,
                    width: 324.w,
                    colorborder: ColorsApp.bordercolororange,
                    widthborder: 1.w,
                    style: AppFont.H2(context, ColorsApp.whiteapp),
                    hasLeft: true,
                    hasRight: false,
                    hasTop: true,
                    hasBottom: false,
                  ),
                  SizedBox(height: 115.h),
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
                    style: AppFont.H2(context, ColorsApp.whiteapp),
                    hasLeft: true,
                    hasRight: true,
                    hasTop: true,
                    hasBottom: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
