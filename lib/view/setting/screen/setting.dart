import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';
import '../controller/setting_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController controller = SettingsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.box,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: AppBar(
          backgroundColor: ColorsApp.box,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new,
                color: const Color(0xFFA2A2B5), size: 20.sp),
          ),
          title: Text(
            "Settings",
            style: GoogleFonts.inter(
              color: const Color(0xFFA2A2B5),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              buildProfileSection(),
              SizedBox(height: 30.h),
              buildSectionTitle("General"),
              buildGeneralSection(),
              SizedBox(height: 20.h),
              buildSectionTitle("My subscriptions"),
              buildSubscriptionsSection(),
              SizedBox(height: 20.h),
              buildSectionTitle("Appearance"),
              buildAppearanceSection(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileSection() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: const AssetImage('assets/images/Image.png'),
        ),
        SizedBox(height: 10.h),
        Text(
          controller.userName,
          style: GoogleFonts.inter(
            color: ColorsApp.whiteapp,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          controller.email,
          style: GoogleFonts.inter(
            color: ColorsApp.textapp,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 10.h),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsApp.buttonapp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
          ),
          child: Text(
            "Edit profile",
            style: GoogleFonts.inter(color: ColorsApp.whiteapp, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Text(
          title,
          style: GoogleFonts.inter(
            color: ColorsApp.whiteapp,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsApp.translucentContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: children),
    );
  }

  Widget buildGeneralSection() {
    return buildCard([
      buildSettingItem(
          "Security", controller.securityMethod, 'assets/images/FaceID.png'),
      buildSwitchItem("iCloud Sync", controller.iCloudSync, (value) {
        setState(() {
          controller.toggleICloudSync();
        });
      }, Icons.cloud_outlined),
    ]);
  }

  Widget buildSubscriptionsSection() {
    return buildCard([
      buildSettingItem(
          "Sorting", controller.sortingMethod, 'assets/images/Sorting.png'),
      buildSettingItem(
          "Summary", controller.summaryType, 'assets/images/Chart.png'),
      buildSettingItem(
          "Default currency", controller.defaultCurrency, 'assets/images/Money.png'),
    ]);
  }

  Widget buildAppearanceSection() {
    return buildCard([
      buildSettingItem("App icon", controller.appIcon, 'assets/images/App icon.png'),
      buildSettingItem("Theme", controller.themeMode, Icons.light_mode_outlined),
    ]);
  }

  Widget buildSettingItem(String title, String value, dynamic icon) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Row(
          children: [
            icon is String
                ? Image.asset(icon, width: 20.w, height: 20.h, color: ColorsApp.whiteapp)
                : Icon(icon, size: 20.sp, color: ColorsApp.whiteapp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  color: ColorsApp.whiteapp,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8.w),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 120.w),
              child: Text(
                value,
                style: GoogleFonts.inter(
                  color: ColorsApp.white70,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: 6.w),
            Icon(Icons.chevron_right, color: Colors.white38, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchItem(
      String title, bool value, ValueChanged<bool> onChanged, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20.sp, color: ColorsApp.whiteapp),
              SizedBox(width: 12.w),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: ColorsApp.whiteapp,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: ColorsApp.orangapp,
          ),
        ],
      ),
    );
  }
}
