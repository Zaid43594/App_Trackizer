import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/views/customs/custom_app_icon.dart';
import 'package:trackizer/views/pages/Credit_Cards.dart';
import 'package:trackizer/views/pages/calendar_page.dart';
import 'package:trackizer/views/pages/home_page.dart';
import 'package:trackizer/views/customs/custom_container.dart';
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
              offset: const Offset(8, 2),
            ),
          ],
        ),
        child: Transform.translate(
          offset: const Offset(15.5, -1),
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
        offsetX: -25,
        offsetY: 20,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomContainer(
          height: 80.h,
          width: 327.w,
          padding: EdgeInsets.only(bottom: 20),
          child: PhysicalModel(
            color: ColorsApp.background.withOpacity(1),
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
                      _onTap(0);
                    },
                    icon: Icon(
                      MyIcons.home,
                      size: 24,
                      color: _currentIndex == 0
                          ? ColorsApp.whiteapp
                          : ColorsApp.titleapp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onTap(1);
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
                      _onTap(2);
                    },
                    icon: Icon(
                      MyIcons.cal,
                      size: 24,
                      color: _currentIndex == 2
                          ? ColorsApp.whiteapp
                          : ColorsApp.titleapp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onTap(3);
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
      body: Column(
        children: [
          Expanded(child: _pages[_currentIndex]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsApp.background.withOpacity(1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.background.withOpacity(0.6),
                    spreadRadius: 20,
                    blurRadius: 10,
                    offset: const Offset(20, -50),
                  ),
                ],
              ),
            ),
          ),
        ],
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

    final x = (scaffoldSize.width - fabSize.width) / 1.9 + offsetX;
    final y = scaffoldSize.height - fabSize.height - 68 + offsetY;

    return Offset(x, y);
  }
}
