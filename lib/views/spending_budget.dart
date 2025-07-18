import 'package:flutter/material.dart';
import 'package:trackizer/core/style/colors.dart';
import 'package:trackizer/core/style/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/models/guage_segment-model.dart';
import 'package:trackizer/widgets/half_ring.dart';

import '../widgets/budget_item.dart';
import '../widgets/dotted_border_box.dart';

class SpendingBudget extends StatefulWidget {
  const SpendingBudget({super.key});

  @override
  State<SpendingBudget> createState() => _SpendingBudgetState();
}

class _SpendingBudgetState extends State<SpendingBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsApp.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
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
                      onPressed: () {},
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
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(height: 250, child: HalfRingGauge()),
                      ),
                      Positioned(
                        top: 70,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Text(
                              "82,97 SP",
                              style: AppFont.H5(context, ColorsApp.whiteapp),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "of 2,000 SP budget",
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
                                  style: AppFont.H2(
                                    context,
                                    ColorsApp.whiteapp,
                                  ),
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
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  BudgetItem(
                    icon: (Icons.directions_car_filled_outlined),
                    label: 'Auto & Transport',
                    spent: '25.99 SP',
                    left: '375 SP left to spend',
                    total: 'of 400 SP',
                    progressColor: ColorsApp.greenapp,
                    progress: 0.06,
                    segment: GaugeSegment(
                      color: ColorsApp.greenapp,
                      percent: 0.25,
                    ),
                  ),
                  BudgetItem(
                    icon: Icons.auto_awesome_sharp,
                    label: 'Entertainment',
                    spent: '50.99 SP',
                    left: '375 SP left to spend',
                    total: 'of 600 SP',
                    progressColor: ColorsApp.orangapp,
                    progress: 0.12,
                    segment: GaugeSegment(
                      color: ColorsApp.orangapp,
                      percent: 0.3,
                    ),
                  ),
                  BudgetItem(
                    icon: Icons.fingerprint,
                    label: 'Security',
                    spent: '5.99 SP',
                    left: '375 SP left to spend',
                    total: 'of 600 SP',
                    progressColor: ColorsApp.purpleapp,
                    progress: 0.01,
                    segment: GaugeSegment(
                      color: ColorsApp.purpleapp,
                      percent: 0.7,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  ClipRRect(
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add new category ",
                                style: AppFont.H2(context, ColorsApp.titleapp),
                              ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
