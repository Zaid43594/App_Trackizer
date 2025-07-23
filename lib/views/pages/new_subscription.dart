import 'package:flutter/material.dart';
import 'package:trackizer/controllers/subscription_controller.dart';
import 'package:trackizer/model/subscription_model.dart';
import 'package:trackizer/views/widgets/subscription_view.dart';


class NewSubscription extends StatefulWidget {
  const NewSubscription({super.key});

  @override
  State<NewSubscription> createState() => _NewSubscriptionState();
}

class _NewSubscriptionState extends State<NewSubscription> {
  late final NewSubscriptionController _controller;
  late final SubscriptionModel _model;

  @override
  void initState() {
    super.initState();
    _controller = NewSubscriptionController();
    _model = SubscriptionModel();
  }

  @override
  Widget build(BuildContext context) {
    return NewSubscriptionView(controller: _controller, model: _model);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}