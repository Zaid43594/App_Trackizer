import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/colors.dart';
import '../../../core/fonts.dart';

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
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),
              // Apple Button
              Positioned(
                left: 25 * scale,
                top: 394 * scale,
                width: 327 * scale,
                height: 48 * scale,
                child: _SocialButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    color: ColorsApp.whiteapp,
                    size: 16 * scale,
                  ),
                  text: 'Sign up with Apple',
                  background: const LinearGradient(
                    colors: [Colors.black, Colors.black],
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
                child: _SocialButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: ColorsApp.blackapp,
                    size: 16 * scale,
                  ),
                  text: 'Sign up with Google',
                  background: const LinearGradient(
                    colors: [Colors.white, Colors.white],
                  ),
                  borderGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.5),
                      Colors.transparent,
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
                child: _SocialButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: ColorsApp.whiteapp,
                    size: 16 * scale,
                  ),
                  text: 'Sign up with Facebook',
                  background: const LinearGradient(
                    colors: [Color(0xFF1771E6), Color(0xFF1771E6)],
                  ),
                  borderGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.3),
                      Colors.transparent,
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
                    style: AppFont.h2(
                      context,
                      ColorsApp.whiteapp,
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999 * scale),
                    color: const Color(0x1AFFFFFF),
                    border: Border.all(
                      width: 1 * scale,
                      color: ColorsApp.transcolor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up with E-mail',
                      style: AppFont.h2(
                        context,
                        ColorsApp.whiteapp,
                      ).copyWith(fontSize: 14 * scale, height: 20 / 14),
                    ),
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
                    style: AppFont.bodySmall(
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

class _SocialButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Gradient background;
  final Gradient borderGradient;
  final List<BoxShadow> boxShadow;
  final Color textColor;
  final Color iconColor;
  final double scale;
  final double textWidth;

  const _SocialButton({
    required this.icon,
    required this.text,
    required this.background,
    required this.borderGradient,
    required this.boxShadow,
    required this.textColor,
    required this.iconColor,
    required this.scale,
    required this.textWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999 * scale),
        gradient: background,
        boxShadow: boxShadow,
        border: Border.all(width: 1 * scale, color: ColorsApp.transcolor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 16 * scale, height: 16 * scale, child: icon),
          SizedBox(width: 8 * scale),
          SizedBox(
            width: textWidth * scale,
            height: 20 * scale,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: AppFont.h2(context, textColor).copyWith(
                  fontSize: 14 * scale,
                  height: 20 / 14,
                  letterSpacing: 0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
