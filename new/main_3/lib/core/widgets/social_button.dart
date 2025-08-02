import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/fonts.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color shadowColor;
  final double scale;
  final bool isLoading;

  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.shadowColor,
    required this.scale,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999 * scale),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.5),
            blurRadius: 25 * scale,
            offset: Offset(0, 8 * scale),
          ),
        ],
        border: Border.all(width: 1 * scale, color: ColorsApp.transcolor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999 * scale),
          onTap: isLoading ? null : onPressed,
          child: Container(
            width: double.infinity,
            height: 48 * scale,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  SizedBox(
                    width: 20 * scale,
                    height: 20 * scale,
                    child: CircularProgressIndicator(
                      strokeWidth: 2 * scale,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    ),
                  )
                else ...[
                  SizedBox(
                    width: 16 * scale,
                    height: 16 * scale,
                    child: FaIcon(icon, color: iconColor, size: 16 * scale),
                  ),
                  SizedBox(width: 8 * scale),
                ],
                if (!isLoading)
                  Text(
                    text,
                    style: AppFont.H2(context, textColor).copyWith(
                      fontSize: 14 * scale,
                      height: 20 / 14,
                      letterSpacing: 0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Predefined social button styles
class SocialButtonStyles {
  static SocialButton apple({
    required VoidCallback? onPressed,
    required double scale,
    bool isLoading = false,
  }) {
    return SocialButton(
      icon: FontAwesomeIcons.apple,
      text: 'Sign up with Apple',
      onPressed: onPressed,
      backgroundColor: Colors.black,
      textColor: ColorsApp.whiteapp,
      iconColor: ColorsApp.whiteapp,
      shadowColor: ColorsApp.blackapp,
      scale: scale,
      isLoading: isLoading,
    );
  }

  static SocialButton google({
    required VoidCallback? onPressed,
    required double scale,
    bool isLoading = false,
  }) {
    return SocialButton(
      icon: FontAwesomeIcons.google,
      text: 'Sign up with Google',
      onPressed: onPressed,
      backgroundColor: Colors.white,
      textColor: ColorsApp.blackapp,
      iconColor: ColorsApp.blackapp,
      shadowColor: ColorsApp.whiteapp,
      scale: scale,
      isLoading: isLoading,
    );
  }

  static SocialButton facebook({
    required VoidCallback? onPressed,
    required double scale,
    bool isLoading = false,
  }) {
    return SocialButton(
      icon: FontAwesomeIcons.facebookF,
      text: 'Sign up with Facebook',
      onPressed: onPressed,
      backgroundColor: const Color(0xFF1771E6),
      textColor: ColorsApp.whiteapp,
      iconColor: ColorsApp.whiteapp,
      shadowColor: ColorsApp.blueapp,
      scale: scale,
      isLoading: isLoading,
    );
  }
}
