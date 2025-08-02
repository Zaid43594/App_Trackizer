// import 'package:flutter/material.dart';
// import 'package:trackizer/controllers/subscription_controller.dart';
// import 'package:trackizer/model/subscription_model.dart';
// import 'package:trackizer/views/widgets/subscription_card.dart';

// class NewSubscription extends StatefulWidget {
//   const NewSubscription({super.key});

//   @override
//   State<NewSubscription> createState() => _NewSubscriptionState();
// }

// class _NewSubscriptionState extends State<NewSubscription> {
//   late final NewSubscriptionController _controller;
//   List<SubscriptionModel> subscriptions = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _controller = NewSubscriptionController();
//     fetchSubscriptions();
//   }

//   Future<void> fetchSubscriptions() async {
//     try {
//       final data = await _controller.fetchSubscriptions(); // من API
//       setState(() {
//         subscriptions = data;
//         isLoading = false;
//       });
//     } catch (e) {
//       debugPrint("Error fetching subscriptions: $e");
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("New Subscription")),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : PageView.builder(
//               controller: _controller.pageController,
//               itemCount: subscriptions.length,
//               onPageChanged: (index) {
//                 setState(() {
//                   _controller.currentPage = index.toDouble();
//                 });
//               },
//               itemBuilder: (context, index) {
//                 final sub = subscriptions[index];
//                 return SubscriptionCard(
//                   imagePath: sub.image,
//                   name: sub.name,
//                   price: "\$${sub.price.toStringAsFixed(2)}",
//                 );
//               },
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
