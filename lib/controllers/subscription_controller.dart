import 'package:flutter/material.dart';

class NewSubscriptionController {
  final PageController pageController = PageController(
    viewportFraction: 0.6,
    initialPage: 1,
  );

  double currentPage = 1;

  void addPageListener(VoidCallback onUpdate) {
    pageController.addListener(() {
      currentPage = pageController.page ?? currentPage;
      onUpdate();
    });
  }

  void dispose() {
    pageController.dispose();
  }
}
