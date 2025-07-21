import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../core/colors.dart';
import '../../../core/fonts.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/widgets/custom_button.dart' as custom;
import '../controller/welcome_controller.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final WelcomeController _controller = WelcomeController();

  // UI Event Handlers
  void _handleGetStartedPressed() {
    if (_controller.canNavigateToRegister()) {
      _controller.prepareNavigationToRegister();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Register1Screen()),
      ).then((_) {
        _controller.completeNavigation();
      });
    }
  }

  void _handleLoginPressed() {
    if (_controller.canNavigateToLogin()) {
      _controller.prepareNavigationToLogin();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login screen coming soon!'),
          duration: Duration(seconds: 2),
        ),
      );
      _controller.completeNavigation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final scale = ResponsiveUtils.getScale(context);
    final blobPositions = ResponsiveUtils.getBlobPositions(context);

    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Center(
        child: SizedBox(
          width: ResponsiveUtils.artboardWidth * scale,
          height: ResponsiveUtils.artboardHeight * scale,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Shadows-and-blur.svg (background overlay, below everything else)
              Builder(
                builder: (context) {
                  final size = MediaQuery.of(context).size;
                  final bool isTablet = size.width > 600;
                  final double shadowLeft = 3;
                  final double shadowTop = isTablet ? 150 * scale : 200 * scale;
                  final double shadowWidth =
                      isTablet ? 600 * scale : 480 * scale;
                  final double shadowHeight =
                      isTablet ? 500 * scale : 420 * scale;
                  return Positioned(
                    left: shadowLeft,
                    top: shadowTop,
                    width: shadowWidth,
                    height: shadowHeight,
                    child: Opacity(
                      opacity: 1,
                      child: Transform.rotate(
                        angle: 15 * 3.1415926535 / 180,
                        child: Image.asset(
                          'assets/Shadows-and-blur.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
              // log-bg2l.png (left decorative blob) - adaptive positioning
              Positioned(
                left: blobPositions['leftBlobLeft']!,
                top: blobPositions['leftBlobTop']!,
                width: 288 * scale,
                height: 219 * scale,
                child: Opacity(
                  opacity: 1.0,
                  child: Transform.rotate(
                    angle: 0,
                    child: Image.asset(
                      'assets/log-bg2l.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // log-bg1r.png (right decorative blob) - adaptive positioning
              Positioned(
                left: blobPositions['rightBlobLeft']!,
                top: blobPositions['rightBlobTop']!,
                width: 288 * scale,
                height: 219 * scale,
                child: Opacity(
                  opacity: 1.0,
                  child: Transform.rotate(
                    angle: 41.66 * 3.1415926535 / 180,
                    child: Image.asset(
                      'assets/log-bg1r.png',
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
                child: Image.asset('assets/Frame.png', fit: BoxFit.cover),
              ),
              // Logo
              Positioned(
                left: 98 * scale,
                top: 60 * scale,
                width: 178 * scale,
                height: 29 * scale,
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
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
                    style: AppFont.h3(context, ColorsApp.whiteapp).copyWith(
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
                child: custom.CustomButton(
                  text: 'Get started',
                  onPressed: () => _handleGetStartedPressed(),
                  style: custom.ButtonStyle.primary(scale: scale),
                  scale: scale,
                ),
              ),
              // I have an account Button
              Positioned(
                left: 25 * scale,
                top: 734 * scale,
                width: 324 * scale,
                height: 48 * scale,
                child: custom.CustomButton(
                  text: 'I have an account',
                  onPressed: () => _handleLoginPressed(),
                  style: custom.ButtonStyle.secondary(scale: scale),
                  scale: scale,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
