import 'package:flutter/material.dart';

class NewSubscriptionController {
  final PageController pageController = PageController(
    viewportFraction: 0.6,
    initialPage: 1,
  );

  double currentPage = 1;
  VoidCallback? _listener;

  void addPageListener(VoidCallback onUpdate) {
    _listener = () {
      currentPage = pageController.page ?? currentPage;
      onUpdate();
    };
    pageController.addListener(_listener!);
  }

  void dispose() {
    if (_listener != null) {
      pageController.removeListener(_listener!);
    }
  }
}
