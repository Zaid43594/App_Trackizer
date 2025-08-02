import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:trackizer/controllers/subscription_controller.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/model/subscription_model.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/widgets/icon_button.dart';
import 'package:trackizer/views/widgets/custom_textfromfield.dart';

const String apiUrl =
    "https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions";

const Map<String, String> headers = {
  "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw",
  "apikey":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw",
  "Accept": "application/json",
};

class NewSubscriptionView extends StatefulWidget {
  final NewSubscriptionController controller;
  final String headerTitle;

  const NewSubscriptionView({
    super.key,
    required this.controller,
    this.headerTitle = "New",
  });

  @override
  State<NewSubscriptionView> createState() => _NewSubscriptionViewState();
}

class _NewSubscriptionViewState extends State<NewSubscriptionView> {
  List<SubscriptionModel> subscriptions = [];
  int currentIndex = 1;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();

    fetchSubscriptions();

    widget.controller.addPageListener(() {
      final index = widget.controller.currentPage.round();
      if (index >= 0 && index < subscriptions.length) {
        setState(() {
          currentIndex = index;
          _priceController.text = subscriptions[index].price.toStringAsFixed(2);
          _descriptionController.text = subscriptions[index].description ?? "";
        });
      }
    });
  }

  Future<void> fetchSubscriptions() async {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      setState(() {
        subscriptions =
            data.map((json) => SubscriptionModel.fromJson(json)).toList();

        _priceController.text =
            subscriptions[widget.controller.currentPage.round()]
                .price
                .toStringAsFixed(2);
        _descriptionController.text =
            subscriptions[widget.controller.currentPage.round()].description ??
                "";
      });
    }
  }

  Future<void> addSubscription({
    required String name,
    required String image,
    required double price,
    String? description,
  }) async {
    final body = jsonEncode({
      "name": name,
      "image": image,
      "price": price,
      "description": description ?? "",
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw",
        "apikey":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw",
        "Content-Type": "application/json",
      },
      body: body,
    );

    if (response.statusCode == 201) {
      await fetchSubscriptions();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Subscription added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add subscription: ${response.body}')),
      );
    }
  }

  void _incrementPrice() {
    final currentText = _priceController.text;
    if (currentText.isEmpty) return;

    final currentDouble = double.tryParse(currentText);
    if (currentDouble == null) return;

    final newValue = currentDouble + 1;

    setState(() {
      _priceController.text = newValue.toStringAsFixed(
        newValue.truncateToDouble() == newValue ? 0 : 1,
      );
    });
  }

  void _decrementPrice() {
    final currentText = _priceController.text;
    if (currentText.isEmpty) return;

    final currentDouble = double.tryParse(currentText);
    if (currentDouble == null || currentDouble <= 0) return;

    final newValue = currentDouble - 1;

    setState(() {
      _priceController.text = newValue.toStringAsFixed(
        newValue.truncateToDouble() == newValue ? 0 : 1,
      );
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String getImagePath(String name) {
    final lowerName = name.toLowerCase();

    if (lowerName.contains('spotify')) {
      return ImagePaths.spotify;
    } else if (lowerName.contains('netflix')) {
      return ImagePaths.netflix;
    } else if (lowerName.contains('youtube')) {
      return ImagePaths.youtube;
    } else if (lowerName.contains('proton')) {
      return ImagePaths.hbogo;
    } else {
      return " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    if (subscriptions.isEmpty) {
      return Scaffold(
        backgroundColor: ColorsApp.background,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final selectedSubscription = subscriptions[currentIndex];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 476.h,
                decoration: BoxDecoration(
                  color: ColorsApp.boxcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 56.h,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorsApp.titleapp,
                                    size: 24.w,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.headerTitle,
                                style: AppFont.BodyLarge(
                                    context, ColorsApp.titleapp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: Text(
                          "Add new\nsubscription",
                          style: AppFont.H7(context, ColorsApp.whiteapp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        height: 220.h,
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: subscriptions.length,
                          itemBuilder: (context, index) {
                            final isCurrent = index == currentIndex;
                            final scale = isCurrent ? 1.0 : 0.85;
                            final item = subscriptions[index];

                            return AnimatedScale(
                              scale: scale,
                              duration: const Duration(milliseconds: 300),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 161.h,
                                      width: 161.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(48.r),
                                      ),
                                      child: Image.asset(
                                        getImagePath(item.name),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(height: 23.h),
                                    Text(
                                      item.name,
                                      style: AppFont.H2(
                                          context, ColorsApp.whiteapp),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      "Description",
                      style: AppFont.bodymeduim(context, ColorsApp.titleapp),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: _descriptionController,
                      readOnly: true,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 51.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButtonContainer(
                          icon: Icons.remove,
                          onTap: _decrementPrice,
                        ),
                        SizedBox(width: 35.w),
                        Column(
                          children: [
                            Text(
                              "Monthly price",
                              style: AppFont.H1(context, ColorsApp.titleapp),
                            ),
                            SizedBox(height: 6.h),
                            SizedBox(
                              width: 162.w,
                              child: TextFormField(
                                readOnly: true,
                                controller: _priceController,
                                keyboardType: TextInputType.number,
                                style: AppFont.H4(context, ColorsApp.whiteapp),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "0.00",
                                  hintStyle:
                                      AppFont.H5(context, ColorsApp.whiteapp),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorsApp.cardcolor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30.w),
                        IconButtonContainer(
                          icon: Icons.add,
                          onTap: _incrementPrice,
                        ),
                      ],
                    ),
                    SizedBox(height: 55.h),
                    CustomElevatedButton(
                      text: "Add this platform",
                      onPressed: () {
                        final selected = subscriptions[currentIndex];
                        addSubscription(
                          name: selected.name,
                          image: selected.image,
                          price: double.tryParse(_priceController.text) ?? 0.0,
                          description: _descriptionController.text,
                        );
                      },
                      colorbutton: ColorsApp.orangapp,
                      height: 48.h,
                      width: 324.w,
                      colorborder: ColorsApp.rangeColor,
                      widthborder: 1.w,
                      style: AppFont.H2(context, ColorsApp.whiteapp),
                      hasLeft: true,
                      hasRight: false,
                      hasTop: true,
                      hasBottom: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
