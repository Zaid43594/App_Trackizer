import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static TextStyle H1(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle BodyLarge(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle H3(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle H4(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle H5(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle H7(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 40.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle bodymeduim(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle bodysmall(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle H2(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    ));
  }

  static TextStyle H6(BuildContext context, Color color) {
    return (GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      color: color,
    ));
  }

  static h3(BuildContext context, Color whiteapp) {}
}
