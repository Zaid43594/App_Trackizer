import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/pages/signin.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double artboardWidth = 375.0;
    const double artboardHeight = 812.0;
    final double scaleX = size.width / artboardWidth;
    final double scaleY = size.height / artboardHeight;
    final double scale = scaleX < scaleY ? scaleX : scaleY;

    // Detect if it's a tablet (wider screen)
    final bool isTablet = size.width > 600;

    // Adjust blob positions for tablets
    final double leftBlobLeft =
        isTablet ? size.width * -0.57 : size.width * -0.62;
    final double leftBlobTop =
        isTablet ? size.height * 0.2 : size.height * 0.148;
    final double rightBlobLeft =
        isTablet ? size.width * 0.75 : size.width * 0.853;
    final double rightBlobTop =
        isTablet ? size.height * 0.5 : size.height * 0.443;

    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Center(
        child: SizedBox(
          width: artboardWidth * scale,
          height: artboardHeight * scale,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // log-bg2l.png (left decorative blob) - adaptive positioning
              Positioned(
                left: leftBlobLeft,
                top: leftBlobTop,
                width: 288 * scale,
                height: 219 * scale,
                child: Opacity(
                  opacity: 1.0,
                  child: Transform.rotate(
                    angle: 0,
                    child: Image.asset(
                      ImagePaths.bg2,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // log-bg1r.png (right decorative blob) - adaptive positioning
              Positioned(
                left: rightBlobLeft,
                top: rightBlobTop,
                width: 288 * scale,
                height: 219 * scale,
                child: Opacity(
                  opacity: 1.0,
                  child: Transform.rotate(
                    angle: -41.66 * 3.1415926535 / 180,
                    child: Image.asset(
                      ImagePaths.bg1,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Frame image (centered, large)
              Positioned(
                left: 43 * scale,
                top: 148 * scale,
                width: 289 * scale,
                height: 410 * scale,
                child: Image.asset(ImagePaths.Frame, fit: BoxFit.cover),
              ),
              // Logo
              Positioned(
                left: 98 * scale,
                top: 60 * scale,
                width: 178 * scale,
                height: 29 * scale,
                child: Image.asset(ImagePaths.logo, fit: BoxFit.contain),
              ),
              // Headline text
              Positioned(
                left: 91 * scale,
                top: 590 * scale,
                width: 193 * scale,
                height: 20 * scale,
                child: Center(
                  child: Text(
                    'Spend Less.. Save More',
                    textAlign: TextAlign.center,
                    style: AppFont.H3(context, ColorsApp.whiteapp).copyWith(
                      fontSize: 16 * scale,
                      height: 20 / 16,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
              // Get Started Button
              Positioned(
                left: 25 * scale,
                top: 670 * scale,
                width: 324 * scale,
                height: 48 * scale,
                child: CustomElevatedButton(
                  text: 'Get started',
                  colorbutton: ColorsApp.orangapp,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register1Screen(),
                      ),
                    );
                  },
                  height: 48.h,
                  width: 324.w,
                  colorborder: ColorsApp.bordercolororange,
                  widthborder: 1.w,
                  style: AppFont.H2(context,ColorsApp.whiteapp),
                ),
              ),
              // I have an account Button
              Positioned(
                left: 25 * scale,
                top: 734 * scale,
                width: 324 * scale,
                height: 48 * scale,
                child: CustomElevatedButton(
                  text: 'I have an account',
                  colorbutton: ColorsApp.bottomcolor,
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
                  widthborder: 2.w,
                  style: AppFont.H2(context,ColorsApp.whiteapp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
