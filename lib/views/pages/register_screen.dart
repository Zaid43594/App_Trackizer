import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/pages/register.dart';
import 'package:trackizer/views/pages/signin.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/widgets/custom_button.dart' as custom;
import '../../../core/widgets/social_button.dart';
import '../../../controllers/register_controller.dart';
import 'package:trackizer/features/welcome/model/register_model.dart';

class Register1Screen extends StatefulWidget {
  const Register1Screen({super.key});

  @override
  State<Register1Screen> createState() => _Register1ScreenState();
}

class _Register1ScreenState extends State<Register1Screen> {
  final RegisterController _controller = RegisterController();

  // UI Event Handlers
  void _handleAppleSignUp() {
    if (_controller.canAuthenticateWith(AuthProvider.apple)) {
      _controller.startAuthentication(AuthProvider.apple);
      _showLoadingSnackBar(_controller.getCurrentStatus());
      Future.delayed(const Duration(seconds: 2), () {
        _controller.completeAuthentication();
        setState(() {});
      });
    }
  }

  void _handleGoogleSignUp() {
    if (_controller.canAuthenticateWith(AuthProvider.google)) {
      _controller.startAuthentication(AuthProvider.google);
      _showLoadingSnackBar(_controller.getCurrentStatus());
      Future.delayed(const Duration(seconds: 2), () {
        _controller.completeAuthentication();
        setState(() {});
      });
    }
  }

  void _handleFacebookSignUp() {
    if (_controller.canAuthenticateWith(AuthProvider.facebook)) {
      _controller.startAuthentication(AuthProvider.facebook);
      _showLoadingSnackBar(_controller.getCurrentStatus());
      Future.delayed(const Duration(seconds: 2), () {
        _controller.completeAuthentication();
        setState(() {});
      });
    }
  }

  // void _handleEmailSignUp() {
  //   if (_controller.canAuthenticateWith(AuthProvider.email)) {
  //     _controller.startAuthentication(AuthProvider.email);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Email registration coming soon!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //     _controller.completeAuthentication();
  //   }
  // }

  void _showLoadingSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Text(message),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = ResponsiveUtils.getScale(context);

    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Center(
        child: SizedBox(
          width: ResponsiveUtils.artboardWidth * scale,
          height: ResponsiveUtils.artboardHeight * scale,
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
                child: SocialButtonStyles.apple(
                  onPressed: () => _handleAppleSignUp(),
                  scale: scale,
                ),
              ),
              // Google Button
              Positioned(
                left: 25 * scale,
                top: 458 * scale,
                width: 327 * scale,
                height: 48 * scale,
                child: SocialButtonStyles.google(
                  onPressed: () => _handleGoogleSignUp(),
                  scale: scale,
                ),
              ),
              // Facebook Button
              Positioned(
                left: 25 * scale,
                top: 522 * scale,
                width: 327 * scale,
                height: 48 * scale,
                child: SocialButtonStyles.facebook(
                  onPressed: () => _handleFacebookSignUp(),
                  scale: scale,
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
                child: custom.CustomButton(
                  text: 'Sign up with E-mail',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  style: custom.ButtonStyle.secondary(scale: scale),
                  scale: scale,
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
