import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_bar_icon.dart';
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
          offset: const Offset(9.3, -3),
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
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: CustomIcon(
              icon: Icons.add,
              color: ColorsApp.whiteapp,
              size: 28,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: CustomFABLocation(
        offsetX: -13.5,
        offsetY: 25,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: CustomContainer(
          height: 80.h,
          width: 327.w,
          padding: EdgeInsets.only(bottom: 20),
          child: PhysicalModel(
            color: ColorsApp.transcolor,
            elevation: 20,
            borderRadius: BorderRadius.circular(16.r),
            clipBehavior: Clip.antiAlias,
            child: BottomAppBar(
              color: Color(0xff4e4e61),
              shape: CircularNotchedRectangle(),
              notchMargin: 9.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: Icon(
                      MyIcons.home,
                      size: 24,
                      color: _currentIndex == 0
                          ? ColorsApp.whiteapp
                          : ColorsApp.titleapp,
                    ),
                  ),
                  SizedBox(width: 30.w),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SpendingBudget(),
                        ),
                      );
                    },
                    icon: Icon(
                      MyIcons.grid,
                      size: 24,
                      color: _currentIndex == 1
                          ? ColorsApp.whiteapp
                          : ColorsApp.titleapp,
                    ),
                  ),
                  SizedBox(width: 95.w),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CalendarPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      MyIcons.cal,
                      size: 24,
                      color: _currentIndex == 2
                          ? ColorsApp.whiteapp
                          : ColorsApp.titleapp,
                    ),
                  ),
                  SizedBox(width: 29.w),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreditCardScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      MyIcons.wal,
                      size: 24,
                      color: _currentIndex == 3
                          ? ColorsApp.whiteapp
                          : ColorsApp.titleapp,
                    ),
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

    final x = (scaffoldSize.width - fabSize.width) / 1.9 + offsetX;
    final y = scaffoldSize.height - fabSize.height - 68 + offsetY;

    return Offset(x, y);
  }
}
