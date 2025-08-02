import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double artboardWidth = 375.0;
  static const double artboardHeight = 812.0;

  static double getScale(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scaleX = size.width / artboardWidth;
    final double scaleY = size.height / artboardHeight;
    return scaleX < scaleY ? scaleX : scaleY;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static Map<String, double> getBlobPositions(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTabletDevice = isTablet(context);

    return {
      'leftBlobLeft': isTabletDevice ? size.width * -0.57 : size.width * -0.62,
      'leftBlobTop': isTabletDevice ? size.height * 0.2 : size.height * 0.148,
      'rightBlobLeft': isTabletDevice ? size.width * 0.75 : size.width * 0.853,
      'rightBlobTop': isTabletDevice ? size.height * 0.5 : size.height * 0.443,
    };
  }
}
