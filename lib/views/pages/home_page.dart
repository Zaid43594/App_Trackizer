import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
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
  double currentValue = 1530;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Container(
        child: Column(
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
                        padding:
                            EdgeInsets.only(top: 30.h, right: 14.w, left: 14.w),
                        child: SizedBox(
                          height: 360.h,
                          width: 420.w,
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: maxValue,
                                startAngle: 140,
                                endAngle: 40,
                                showTicks: false,
                                showLabels: false,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.09,
                                  thicknessUnit: GaugeSizeUnit.factor,
                                  color: ColorsApp.axisLine,
                                  cornerStyle: CornerStyle.bothCurve,
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: currentValue,
                                    width: 0.11,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    color: ColorsApp.bordercolororange,
                                    cornerStyle: CornerStyle.bothCurve,
                                    enableAnimation: true,
                                    animationDuration: 800,
                                  ),
                                  RangePointer(
                                    value: currentValue,
                                    width: 0.1,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    color: ColorsApp.rangeColor,
                                    cornerStyle: CornerStyle.bothCurve,
                                    enableAnimation: true,
                                    animationDuration: 800,
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
                                          "${currentValue.toInt()} SP",
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
                                          colorbutton: ColorsApp.bottomcolor,
                                          onPressed: () {},
                                          height: 32.h,
                                          width: 154.w,
                                          colorborder:
                                              ColorsApp.bordercolorgrey,
                                          widthborder: 2.w,
                                          style: AppFont.H1(
                                              context, ColorsApp.whiteapp),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                            value: '12',
                            topColor: ColorsApp.orangapp,
                          ),
                          StatCard(
                            label: 'Highest subs',
                            value: '19.99 SP',
                            topColor: ColorsApp.purpleapp,
                          ),
                          StatCard(
                            label: 'Lowest subs',
                            value: '5.99 SP',
                            topColor: ColorsApp.greenapp,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 25.h),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
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
            const Expanded(child: ToggleTabs()),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
