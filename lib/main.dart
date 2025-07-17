import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/screens/new_subscription.dart';
import 'dart:developer';

import 'package:trackizer/views/spending_budget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        log('screenUtil width: ${375.w}');
        log('screenUtil height: ${812.h}');

        return MaterialApp(
          home: SpendingBudget(),
          routes: {
            "new subscription": (context) => NewSubscription(),
            "spending & budget": (context) => SpendingBudget(),
          },
        );
      },
    );
  }
}
