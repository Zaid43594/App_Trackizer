import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../view/signin.dart';
import 'colors.dart';

class CustomBottomNavWithFAB extends StatefulWidget {
  const CustomBottomNavWithFAB({super.key});

  @override
  State<CustomBottomNavWithFAB> createState() => _CustomBottomNavWithFABState();
}

class _CustomBottomNavWithFABState extends State<CustomBottomNavWithFAB> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorsApp.orangapp.withOpacity(0.6),
              blurRadius: 25.r,
              spreadRadius: 1.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Transform.translate(
          offset: Offset(8.w, 4.h),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorsApp.orangapp,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 28.sp),
          ),
        ),
      ),
      floatingActionButtonLocation: CustomFABLocation(
        offsetX: -18.w,
        offsetY: 18.h,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),   
             child: Container(
           height: 80.h,
          width: 329.w,
          padding: EdgeInsets.only(bottom: 20.h),
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 20,
            borderRadius: BorderRadius.circular(16.r),
            clipBehavior: Clip.antiAlias,
            child: BottomAppBar(
              color: ColorsApp.cardcolor,
              shape: const CircularNotchedRectangle(),
              notchMargin: 9.r,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNavIcon('assets/images/Home.svg', 0),
                             buildNavIcon(
                            'assets/images/Budgets.svg',
                            3,
                            navigate: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 40),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          buildNavIcon('assets/images/Calendar.svg', 2),
                                                                             buildNavIcon('assets/images/Credit Cards.svg', 1),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavIcon(String assetName, int index, {bool navigate = false}) {
    return SizedBox(
      height: 73.h,
      width: 73.w,
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            assetName,
            color: selectedIndex == index ? ColorsApp.orangapp : Colors.white,
            width: 30.w,
            height: 30.h,
          ),
          onPressed: () {
            onItemTapped(index);
            if (navigate && index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            }
          },
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
    final y = scaffoldSize.height - fabSize.height - 80.h + offsetY;

    return Offset(x, y);
  }
}
