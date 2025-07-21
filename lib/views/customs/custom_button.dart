// import 'package:flutter/material.dart';
// import 'package:trackizer/core/constants/colors.dart';
// import 'package:trackizer/core/constants/fonts.dart';


// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final ButtonStyle style;
//   final double scale;
//   final bool isLoading;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     required this.style,
//     required this.scale,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(999 * scale),
//         gradient: style.gradient,
//         boxShadow: style.shadows,
//         border: style.border,
//         color: style.backgroundColor,
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(999 * scale),
//           onTap: isLoading ? null : onPressed,
//           child: Container(
//             width: double.infinity,
//             height: 48 * scale,
//             child: Center(
//               child:
//                   isLoading
//                       ? SizedBox(
//                         width: 20 * scale,
//                         height: 20 * scale,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2 * scale,
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                             style.textColor ?? ColorsApp.whiteapp,
//                           ),
//                         ),
//                       )
//                       : Text(
//                         text,
//                         style: AppFont.H3(
//                           context,
//                           style.textColor ?? ColorsApp.whiteapp,
//                         ).copyWith(
//                           fontSize: 16 * scale,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ButtonStyle {
//   final Gradient? gradient;
//   final Color? backgroundColor;
//   final List<BoxShadow>? shadows;
//   final Border? border;
//   final Color? textColor;

//   const ButtonStyle({
//     this.gradient,
//     this.backgroundColor,
//     this.shadows,
//     this.border,
//     this.textColor,
//   });

//   static ButtonStyle primary({required double scale, Color? textColor}) {
//     return ButtonStyle(
//       gradient: const LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Color(0xFFFF8500), Color(0xFFFF8500)],
//       ),
//       shadows: [
//         BoxShadow(
//           color: ColorsApp.orangapp.withValues(alpha: 0.5),
//           blurRadius: 25 * scale,
//           offset: Offset(0, 8 * scale),
//         ),
//       ],
//       border: Border.all(
//         width: 1 * scale,
//         style: BorderStyle.solid,
//         color: ColorsApp.transcolor,
//       ),
//       textColor: textColor ?? ColorsApp.whiteapp,
//     );
//   }

//   static ButtonStyle secondary({required double scale, Color? textColor}) {
//     return ButtonStyle(
//       backgroundColor: const Color(0x1AFFFFFF),
//       border: Border.all(
//         width: 1 * scale,
//         style: BorderStyle.solid,
//         color: ColorsApp.transcolor,
//       ),
//       textColor: textColor ?? ColorsApp.whiteapp,
//     );
//   }

//   static ButtonStyle social({
//     required double scale,
//     required Color backgroundColor,
//     required Color textColor,
//     required Color shadowColor,
//   }) {
//     return ButtonStyle(
//       backgroundColor: backgroundColor,
//       shadows: [
//         BoxShadow(
//           color: shadowColor.withValues(alpha: 0.5),
//           blurRadius: 25 * scale,
//           offset: Offset(0, 8 * scale),
//         ),
//       ],
//       border: Border.all(
//         width: 1 * scale,
//         style: BorderStyle.solid,
//         color: ColorsApp.transcolor,
//       ),
//       textColor: textColor,
//     );
//   }
// }
