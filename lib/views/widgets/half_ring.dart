import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/colors.dart';

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
          startAngle: -106,
          endAngle: -37,
          radiusFactor: 0.99,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: [
            RangePointer(
              value: 100,
              width: 0.17,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsApp.purpleapp.withAlpha(70),
              enableAnimation: true,
              animationDuration: 1500,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -103,
          endAngle: -40,
          radiusFactor: 0.955,
          axisLineStyle: AxisLineStyle(
            thickness: 0.1,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: [
            RangePointer(
              value: 100,
              width: 0.1,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsApp.purpleapp,
              enableAnimation: true,
              animationDuration: 1500,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -159,
          endAngle: -107,
          radiusFactor: 0.999,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: [
            RangePointer(
              value: 100,
              width: 0.17,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsApp.orangapp.withAlpha(40),
              enableAnimation: true,
              animationDuration: 1500,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: -157,
          endAngle: -110,
          radiusFactor: 0.967,
          axisLineStyle: AxisLineStyle(
            thickness: 0.1,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: [
            RangePointer(
              value: 100,
              width: 0.1,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsApp.orangapp,
              enableAnimation: true,
              animationDuration: 1500,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 178,
          endAngle: -160,
          radiusFactor: 0.998,
          axisLineStyle: AxisLineStyle(
            thickness: 0.19,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: [
            RangePointer(
              value: 100,
              width: 0.17,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsApp.greenapp.withAlpha(40),
              enableAnimation: true,
              animationDuration: 1500,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
        ),
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: -162,
          radiusFactor: 0.965,
          axisLineStyle: AxisLineStyle(
            thickness: 0.1,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: [
            RangePointer(
              value: 100,
              width: 0.1,
              sizeUnit: GaugeSizeUnit.factor,
              color: ColorsApp.greenapp,
              enableAnimation: true,
              animationDuration: 1500,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
        ),
      ],
    );
  }
}
