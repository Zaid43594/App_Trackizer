import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/model/social_button.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/pages/register.dart';

class Register1Screen extends StatelessWidget {
  const Register1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double artboardWidth = 375.0;
    const double artboardHeight = 812.0;
    final double scaleX = size.width / artboardWidth;
    final double scaleY = size.height / artboardHeight;
    final double scale = scaleX < scaleY ? scaleX : scaleY;

    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Center(
        child: SizedBox(
          width: artboardWidth * scale,
          height: artboardHeight * scale,
          child: Stack(
            children: [
              // Logo
              Positioned(
                left: 114 * scale,
                top: 58 * scale,
                width: 146 * scale,
                height: 24 * scale,
                child: Image.asset(ImagePaths.logo, fit: BoxFit.contain),
              ),
              // Apple Button
              Positioned(
                left: 25 * scale,
                top: 394 * scale,
                width: 327 * scale,
                height: 48 * scale,
                child: SocialButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    color: ColorsApp.whiteapp,
                    size: 16 * scale,
                  ),
                  text: 'Sign up with Apple',
                  background: LinearGradient(
                    colors: [ColorsApp.blackcolor, ColorsApp.blackcolor],
                  ),
                  borderGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.15),
                      Colors.transparent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.blackapp.withOpacity(0.5),
                      blurRadius: 25 * scale,
                      offset: Offset(0, 8 * scale),
                    ),
                  ],
                  textColor: ColorsApp.whiteapp,
                  iconColor: ColorsApp.whiteapp,
                  scale: scale,
                  textWidth: 136,
                ),
              ),
              // Google Button
              Positioned(
                left: 25 * scale,
                top: 458 * scale,
                width: 327 * scale,
                height: 48 * scale,
                child: SocialButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: ColorsApp.blackapp,
                    size: 16 * scale,
                  ),
                  text: 'Sign up with Google',
                  background: LinearGradient(
                    colors: [ColorsApp.whiteapp, ColorsApp.whiteapp],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorsApp.transparentwhite5,
                      ColorsApp.transcolor,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.whiteapp.withOpacity(0.25),
                      blurRadius: 25 * scale,
                      offset: Offset(0, 8 * scale),
                    ),
                  ],
                  textColor: ColorsApp.blackapp,
                  iconColor: ColorsApp.blackapp,
                  scale: scale,
                  textWidth: 136,
                ),
              ),
              // Facebook Button
              Positioned(
                left: 25 * scale,
                top: 522 * scale,
                width: 327 * scale,
                height: 48 * scale,
                child: SocialButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: ColorsApp.whiteapp,
                    size: 16 * scale,
                  ),
                  text: 'Sign up with Facebook',
                  background: LinearGradient(
                    colors: [ColorsApp.blueapp, ColorsApp.blueapp],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorsApp.transparentwhite3,
                      ColorsApp.transcolor,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.blueapp.withOpacity(0.5),
                      blurRadius: 25 * scale,
                      offset: Offset(0, 8 * scale),
                    ),
                  ],
                  textColor: ColorsApp.whiteapp,
                  iconColor: ColorsApp.whiteapp,
                  scale: scale,
                  textWidth: 154,
                ),
              ),
              // 'or' text
              Positioned(
                left: 25 * scale,
                top: 610 * scale,
                width: 326 * scale,
                height: 20 * scale,
                child: Center(
                  child: Text(
                    'or',
                    style: AppFont.H2(
                      context,ColorsApp.whiteapp
                    ).copyWith(fontSize: 14 * scale, height: 20 / 14),
                  ),
                ),
              ),
              // Email Button
              Positioned(
                left: 25 * scale,
                top: 670 * scale,
                width: 324 * scale,
                height: 48 * scale,
                child: CustomElevatedButton(
                  text: 'Sign up with E-mail',
                  colorbutton: ColorsApp.bottomcolor,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  height: 48.h,
                  width: 324.w,
                  colorborder: ColorsApp.bordercolorgrey,
                  widthborder: 1.w,
                  style: AppFont.H2(
                    context,ColorsApp.whiteapp
                  ),
                ),
              ),
              // Terms text
              Positioned(
                left: 25 * scale,
                top: 742 * scale,
                width: 326 * scale,
                height: 32 * scale,
                child: Center(
                  child: Text(
                    'By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.',
                    textAlign: TextAlign.center,
                    style: AppFont.bodysmall(
                      context,
                      ColorsApp.textapp,
                    ).copyWith(
                      fontSize: 12 * scale,
                      height: 16 / 12,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
