import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/pages/Credit_Cards.dart';
import 'package:trackizer/views/pages/calendar_page.dart';
import 'package:trackizer/views/pages/home_page.dart';
import 'package:trackizer/views/customs/custom_container.dart';
import 'package:trackizer/views/customs/custom_gesture_detector.dart';
import 'package:trackizer/views/customs/custom_icon.dart';
import 'package:trackizer/views/pages/new_subscription.dart';
import 'package:trackizer/views/widgets/spending_budget.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const SpendingBudget(),
    const CalendarPage(),
    const CreditCardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      extendBody: true,
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
          offset: const Offset(8, 4),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewSubscription(),
                ),
              );
            },
            backgroundColor: ColorsApp.orangapp,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: CustomIcon(
                icon: Icons.add, color: ColorsApp.whiteapp, size: 28),
          ),
        ),
      ),
      floatingActionButtonLocation: CustomFABLocation(offsetX: -13, offsetY: 7),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomContainer(
          height: 100.h,
          width: 329.w,
          padding: EdgeInsets.only(bottom: 20),
          child: PhysicalModel(
            color: ColorsApp.transcolor,
            elevation: 20,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: BottomAppBar(
              color: ColorsApp.cardcolor,
              shape: CircularNotchedRectangle(),
              notchMargin: 9.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.w),
                  CustomGestureDetector(
                    height: 25.h,
                    width: 25.w,
                    path: ImagePaths.home,
                    onTap: () => _onTap(0),
                    color:
                        _currentIndex == 0 ? ColorsApp.orangapp : Colors.white,
                  ),
                  SizedBox(width: 45.w),
                  CustomGestureDetector(
                    height: 25.h,
                    width: 25.w,
                    path: ImagePaths.budgets,
                    onTap: () => _onTap(1),
                    color:
                        _currentIndex == 1 ? ColorsApp.orangapp : Colors.white,
                  ),
                  //
                  SizedBox(width: 100.w),

                  CustomGestureDetector(
                    height: 25.h,
                    width: 25.w,
                    path: ImagePaths.calendar,
                    onTap: () => _onTap(2),
                    color:
                        _currentIndex == 2 ? ColorsApp.orangapp : Colors.white,
                  ),
                  SizedBox(width: 45.w),
                  CustomGestureDetector(
                    height: 25.h,
                    width: 25.w,
                    path: ImagePaths.wallet,
                    onTap: () => _onTap(3),
                    color:
                        _currentIndex == 3 ? ColorsApp.orangapp : Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _pages[_currentIndex],
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
