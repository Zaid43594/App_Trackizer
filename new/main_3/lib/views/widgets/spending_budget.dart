import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/model/guage_segment-model.dart';
import 'package:trackizer/views/customs/custom_app_icon.dart';
import 'package:trackizer/views/pages/settings_screen.dart';
import 'package:trackizer/views/widgets/budget_item.dart';
import 'package:trackizer/views/widgets/dotted_border_box.dart';
import 'package:trackizer/views/widgets/half_ring.dart';

const String apiUrl =
    "https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/spending_categories";

const Map<String, String> headers = {
  "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw",
  "apikey":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw",
  "Accept": "application/json",
};

class SpendingBudget extends StatefulWidget {
  const SpendingBudget({super.key});

  @override
  State<SpendingBudget> createState() => _SpendingBudgetState();
}

class _SpendingBudgetState extends State<SpendingBudget> {
  List<dynamic> categories = [];
  bool isLoading = true;
  String? error;

  Future<void> fetchSpending() async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (!mounted) return;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            categories = data;
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            error = 'Error: ${response.statusCode}';
            isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          error = e.toString();
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSpending();
  }

  IconData getIconFromName(String? iconName) {
    switch (iconName?.toLowerCase()) {
      case 'auto & transport':
        return MyIcons.car;
      case 'entertainment':
        return MyIcons.entertaiment;
      case 'security':
        return Icons.fingerprint;
      default:
        return Icons.category;
    }
  }

  Color getColor(String label) {
    switch (label.toLowerCase()) {
      case 'auto & transport':
        return ColorsApp.greenapp;
      case 'entertainment':
        return ColorsApp.orangapp;
      case 'security':
        return ColorsApp.purpleapp;
      default:
        return ColorsApp.textapp;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<GaugeSegment> segments = [];

    double totalSpent = 0;
    double totalLimit = 0;

    for (var item in categories) {
      final spent = (item['spent'] ?? 0).toDouble();
      final limit =
          ((item['limit_amount'] ?? 1).toDouble()).clamp(1, double.infinity);
      final progress = (spent / limit).clamp(0.0, 1.0);

      totalSpent += spent;
      totalLimit += limit;

      segments.add(GaugeSegment(
        color: getColor(item['name'] ?? ''),
        percent: progress,
      ));
    }

    double overallProgress =
        totalLimit == 0 ? 0 : (totalSpent / totalLimit).clamp(0.0, 1.0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsApp.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(6, 30, 6, 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 109.w),
                Text(
                  "Spending & Budgets",
                  style: AppFont.BodyLarge(context, ColorsApp.titleapp),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.settings_outlined,
                        color: ColorsApp.titleapp,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 220.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 250,
                          child: HalfRingGauge(),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Text(
                              "${totalSpent.toStringAsFixed(2)} SP",
                              style: AppFont.H5(context, ColorsApp.whiteapp),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "of ${totalLimit.toStringAsFixed(2)} SP budget",
                              style: AppFont.bodysmall(
                                context,
                                ColorsApp.titleapp,
                              ),
                            ),
                            SizedBox(height: 40.h),
                            Container(
                              width: 326.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff4E4E61),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  "Your budgets are on track 👍",
                                  style:
                                      AppFont.H2(context, ColorsApp.whiteapp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : error != null
                      ? Center(child: Text(error!))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: categories.length + 1,
                          itemBuilder: (context, index) {
                            if (index < categories.length) {
                              final item = categories[index];

                              final spent = (item['spent'] ?? 0).toDouble();
                              final total =
                                  ((item['limit_amount'] ?? 1).toDouble())
                                      .clamp(1, double.infinity);
                              double progress = spent / total;
                              progress =
                                  progress.isNaN ? 0 : progress.clamp(0.0, 1.0);

                              final label = item['name'] ?? '';
                              final color = getColor(label);

                              return BudgetItem(
                                icon: getIconFromName(label),
                                label: label,
                                spent: '${spent.toStringAsFixed(2)} SP',
                                left:
                                    '${(total - spent).toStringAsFixed(2)} SP left to spend',
                                total: 'of ${total.toStringAsFixed(2)} SP',
                                progressColor: color,
                                progress: progress,
                                segment: GaugeSegment(
                                  color: color,
                                  percent: progress,
                                ),
                              );
                            } else {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: DottedBorderBox(
                                    radius: 16.r,
                                    color: Colors.grey,
                                    strokeWidth: 1.w,
                                    dashLength: 6,
                                    gapLength: 4,
                                    child: Container(
                                      height: 84.h,
                                      width: 328.w,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Add new category ",
                                                style: AppFont.H2(context,
                                                    ColorsApp.whiteapp)),
                                            SizedBox(width: 5.w),
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: ColorsApp.titleapp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
