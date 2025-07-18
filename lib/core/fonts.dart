import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static TextStyle h1(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle bodyLarge(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle h3(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle h4(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle h5(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle h7(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle bodyMedium(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle bodySmall(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle h2(BuildContext context, Color color) {
    return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );
  }
}
