import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/services/home_services.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';
import 'package:trackizer/views/pages/settings_screen.dart';
import 'package:trackizer/views/widgets/stat_card.dart';
import 'package:trackizer/views/widgets/toggle_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double maxValue = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchhomepage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("حدث خطأ أثناء جلب البيانات"),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            final double currentValue =
                (data['this_month_bills'] ?? 0).toDouble();

            return Column(
              children: [
                SizedBox(
                  height: 0.550.sh,
                  width: double.infinity,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r),
                      ),
                    ),
                    color: ColorsApp.cardcolor,
                    child: Stack(
                      children: [
                        Image.asset(
                          ImagePaths.cricles,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 30.h, right: 14.w, left: 14.w),
                            child: SizedBox(
                              height: 360.h,
                              width: 420.w,
                              child: SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 100,
                                    showLabels: false,
                                    showTicks: false,
                                    startAngle: 140,
                                    endAngle: 40.5,
                                    radiusFactor: 0.97,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 0.11,
                                      thicknessUnit: GaugeSizeUnit.factor,
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: ColorsApp.transparentwhite3,
                                    ),
                                  ),
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 100,
                                    showLabels: false,
                                    showTicks: false,
                                    startAngle: 140,
                                    endAngle: 40,
                                    radiusFactor: 0.966,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 0.1,
                                      thicknessUnit: GaugeSizeUnit.factor,
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: ColorsApp.cardcolor,
                                    ),
                                  ),
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: maxValue,
                                    startAngle: 135,
                                    endAngle: 30,
                                    showTicks: false,
                                    showLabels: false,
                                    radiusFactor: 0.999,
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: currentValue,
                                        width: 0.17,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        cornerStyle: CornerStyle.bothCurve,
                                        enableAnimation: true,
                                        animationDuration: 1200,
                                        color:
                                            ColorsApp.orangapp.withOpacity(0.2),
                                      ),
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                        angle: 90,
                                        positionFactor: 0,
                                        widget: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 50.h),
                                            Image.asset(
                                              ImagePaths.logo,
                                              width: 107.w,
                                              height: 19.h,
                                            ),
                                            SizedBox(height: 24.h),
                                            Text(
                                              '${NumberFormat('#,###').format(data['this_month_bills'])} SP',
                                              style: AppFont.H7(
                                                  context, ColorsApp.whiteapp),
                                            ),
                                            SizedBox(height: 15.h),
                                            Text(
                                              "This month bills",
                                              style: AppFont.H1(
                                                  context, ColorsApp.titlecard),
                                            ),
                                            SizedBox(height: 20.h),
                                            CustomElevatedButton(
                                              text: "See your budget",
                                              colorbutton:
                                                  ColorsApp.bottomcolor,
                                              onPressed: () {},
                                              height: 32.h,
                                              width: 154.w,
                                              colorborder:
                                                  ColorsApp.bordercolorgrey,
                                              widthborder: 2.w,
                                              style: AppFont.H1(
                                                  context, ColorsApp.whiteapp),
                                              hasLeft: true,
                                              hasRight: false,
                                              hasTop: true,
                                              hasBottom: false,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: maxValue,
                                    startAngle: 138,
                                    endAngle: 25,
                                    showTicks: false,
                                    showLabels: false,
                                    radiusFactor: 0.969,
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: currentValue,
                                        width: 0.11,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        cornerStyle: CornerStyle.bothCurve,
                                        enableAnimation: true,
                                        animationDuration: 1200,
                                        color: ColorsApp.orangapp,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20.h,
                          left: 12.w,
                          right: 12.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatCard(
                                label: 'Active subs',
                                value: '${data['active_subs']}',
                                topColor: ColorsApp.orangapp,
                              ),
                              StatCard(
                                label: 'Highest subs',
                                value: '${data['highest_sub']}',
                                topColor: ColorsApp.purpleapp,
                              ),
                              StatCard(
                                label: 'Lowest subs',
                                value: '${data['lowest_sub']}',
                                topColor: ColorsApp.greenapp,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingsScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.settings_outlined),
                              color: ColorsApp.titleapp,
                              iconSize: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: ToggleTabs(),
                ),
                SizedBox(
                  height: 75.h,
                )
              ],
            );
          } else {
            return const Center(
              child: Text("لا توجد بيانات متاحة"),
            );
          }
        },
      ),
    );
  }
}
