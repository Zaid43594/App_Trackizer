import 'package:flutter/material.dart';
import 'package:trackizer/core/style/colors.dart';
import 'package:trackizer/core/style/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/models/guage_segment-model.dart';

import '../widgets/budget_item.dart';
import '../widgets/dotted_border_box.dart';

class SpendingBudget extends StatefulWidget {
  const SpendingBudget({super.key});

  @override
  State<SpendingBudget> createState() => _SpendingBudgetState();
}

class _SpendingBudgetState extends State<SpendingBudget> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getHalfRingGauge() {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: 0,
          radiusFactor: 0.95,
          axisLineStyle: AxisLineStyle(
            thickness: 0.06,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
            color: ColorsApp.cardcolor,
          ),
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -109,
          endAngle: -47,
          radiusFactor: 0.99,
          axisLineStyle: AxisLineStyle(
            color: ColorsApp.purpleapp.withAlpha(40),
            thickness: 0.2,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -106,
          endAngle: -50,
          radiusFactor: 0.96,
          axisLineStyle: AxisLineStyle(
            color: ColorsApp.purpleapp,
            thickness: 0.1,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -159,
          endAngle: -107,
          radiusFactor: 0.99,
          axisLineStyle: AxisLineStyle(
            color: ColorsApp.orangapp.withAlpha(40),
            thickness: 0.19,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -157,
          endAngle: -110,
          axisLineStyle: AxisLineStyle(
            color: ColorsApp.orangapp,
            thickness: 0.1,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 178,
          endAngle: -158,
          radiusFactor: 0.998,
          axisLineStyle: AxisLineStyle(
            color: ColorsApp.greenapp.withAlpha(40),
            thickness: 0.19,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: -160,
          radiusFactor: 0.96,
          axisLineStyle: AxisLineStyle(
            color: ColorsApp.greenapp,
            thickness: 0.1,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsApp.background,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorsApp.orangapp.withOpacity(0.6),
              blurRadius: 25,
              spreadRadius: 1,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Transform.translate(
          offset: const Offset(5, 4),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorsApp.orangapp,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: CustomFABLocation(offsetX: -13, offsetY: 7),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 90.w),
                Text(
                  "Spending & Budgets",
                  style: AppFont.BodyLarge(context, ColorsApp.titleapp),
                ),
                SizedBox(width: 62.w),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    color: ColorsApp.titleapp,
                    size: 24,
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
                        child: SizedBox(
                          height: 250,
                          child: _getHalfRingGauge(),
                        ),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 100.h,
          width: 329.w,
          padding: const EdgeInsets.only(bottom: 30),
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 20,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: BottomAppBar(
              color: ColorsApp.cardcolor,
              shape: const CircularNotchedRectangle(),
              notchMargin: 9.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 60.h,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.home,
                          color: _currentIndex == 0
                              ? ColorsApp.orangapp
                              : Colors.white,
                        ),
                        iconSize: 30,
                        onPressed: () => _onTap(0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  SizedBox(
                    height: 60.h,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.grid_view,
                          color: _currentIndex == 1
                              ? ColorsApp.orangapp
                              : Colors.white,
                        ),
                        iconSize: 30,
                        onPressed: () => _onTap(1),
                      ),
                    ),
                  ),
                  SizedBox(width: 110.w),
                  SizedBox(
                    height: 60.h,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          color: _currentIndex == 2
                              ? ColorsApp.orangapp
                              : Colors.white,
                        ),
                        iconSize: 30,
                        onPressed: () => _onTap(2),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  SizedBox(
                    height: 60.h,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.wallet_rounded,
                          color: _currentIndex == 3
                              ? ColorsApp.orangapp
                              : Colors.white,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          // _onTap(3);
                          // Navigator.pushNamed(context, "new subscription");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFABLocation extends FloatingActionButtonLocation {
  final double offsetX;
  final double offsetY;

  CustomFABLocation({this.offsetX = 0.0, this.offsetY = 0.0});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final fabSize = scaffoldGeometry.floatingActionButtonSize;
    final scaffoldSize = scaffoldGeometry.scaffoldSize;

    final x = (scaffoldSize.width - fabSize.width) / 1.90 + offsetX;
    final y = scaffoldSize.height - fabSize.height - 80 + offsetY;

    return Offset(x, y);
  }
}
