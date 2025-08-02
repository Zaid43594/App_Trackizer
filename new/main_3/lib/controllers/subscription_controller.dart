// import 'package:flutter/material.dart';

// class NewSubscriptionController {
//   final PageController pageController = PageController(
//     viewportFraction: 0.6,
//     initialPage: 1,
//   );

//   double currentPage = 1;
//   VoidCallback? _listener;

//   void addPageListener(VoidCallback onUpdate) {
//     _listener = () {
//       currentPage = pageController.page ?? currentPage;
//       onUpdate();
//     };
//     pageController.addListener(_listener!);
//   }

//   void dispose() {
//     if (_listener != null) {
//       pageController.removeListener(_listener!);
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trackizer/model/subscription_model.dart';

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

  Future<List<SubscriptionModel>> fetchSubscriptions() async {
    final url = Uri.parse(
        "https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => SubscriptionModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch subscriptions');
    }
  }
}
