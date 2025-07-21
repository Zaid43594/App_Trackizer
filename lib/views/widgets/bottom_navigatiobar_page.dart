import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/colors.dart';
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
        offsetX: -13.5.w,
        offsetY: 25.h,
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Container(
              height: 30.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.08),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 25.h,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: CustomContainer(
              height: 80.h,
              width: 1.sw - 18.w,
              padding: EdgeInsets.only(bottom: 16.h),
              child: PhysicalModel(
                color: ColorsApp.transcolor,
                elevation: 20,
                borderRadius: BorderRadius.circular(16.r),
                clipBehavior: Clip.antiAlias,
                child: BottomAppBar(
                  color: const Color(0xff4e4e61),
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 9.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => _onTap(0),
                        icon: Icon(
                          MyIcons.home,
                          size: 24.sp,
                          color: _currentIndex == 0
                              ? ColorsApp.whiteapp
                              : ColorsApp.titleapp,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _onTap(1),
                        icon: Icon(
                          MyIcons.grid,
                          size: 24.sp,
                          color: _currentIndex == 1
                              ? ColorsApp.whiteapp
                              : ColorsApp.titleapp,
                        ),
                      ),
                      SizedBox(width: 60.w), 
                      IconButton(
                        onPressed: () => _onTap(2),
                        icon: Icon(
                          MyIcons.cal,
                          size: 24.sp,
                          color: _currentIndex == 2
                              ? ColorsApp.whiteapp
                              : ColorsApp.titleapp,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _onTap(3),
                        icon: Icon(
                          MyIcons.wal,
                          size: 24.sp,
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
        ],
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
    final y = scaffoldSize.height - fabSize.height - 68.h + offsetY;

    return Offset(x, y);
  }
}

class MyIcons {
  static const _kFontFam = 'IcoMoon';

  static const IconData home = IconData(0xe900, fontFamily: _kFontFam);
  static const IconData grid = IconData(0xe901, fontFamily: _kFontFam);
  static const IconData cal = IconData(0xe902, fontFamily: _kFontFam);
  static const IconData wal = IconData(0xe903, fontFamily: _kFontFam);
}
