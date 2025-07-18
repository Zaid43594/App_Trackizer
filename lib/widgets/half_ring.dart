import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/style/colors.dart';

class HalfRingGauge extends StatelessWidget {
  const HalfRingGauge({super.key});

  @override
  Widget build(BuildContext context) {
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
}
