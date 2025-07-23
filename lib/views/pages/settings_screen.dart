import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer/controllers/setting_controller.dart';
import 'package:trackizer/core/constants/colors.dart';
import 'package:trackizer/core/constants/fonts.dart';
import 'package:trackizer/core/constants/image_paths.dart';
import 'package:trackizer/views/customs/custom_elevated_button.dart';

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
      backgroundColor: ColorsApp.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorsApp.greyapp,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 85.w,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.inter(
                      color: ColorsApp.greyapp,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
          backgroundImage: const AssetImage(ImagePaths.image),
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
        CustomElevatedButton(
          text: "Edit profile",
          colorbutton: ColorsApp.buttonapp,
          onPressed: () {},
          height: 32.h,
          width: 114.w,
          colorborder: ColorsApp.bordercolorgrey,
          widthborder: 1.w,
          style: AppFont.H1(
            context,
            ColorsApp.whiteapp,
          ),
          hasLeft: true,
          hasRight: false,
          hasTop: true,
          hasBottom: true,
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
        color: ColorsApp.iconcolor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border(
          left: BorderSide(
            color: ColorsApp.bordercolorgrey,
          ),
          top: BorderSide(
            color: ColorsApp.bordercolorgrey,
          ),
        ),
      ),
      child: Column(children: children),
    );
  }

  Widget buildGeneralSection() {
    return buildCard([
      buildSettingItem(
          "Security", controller.securityMethod, ImagePaths.faceid),
      buildSwitchItem("iCloud Sync", controller.iCloudSync, (value) {
        setState(() {
          controller.toggleICloudSync();
        });
      }, Icons.cloud_outlined),
    ]);
  }

  Widget buildSubscriptionsSection() {
    return buildCard([
      buildSettingItem("Sorting", controller.sortingMethod, ImagePaths.sorting),
      buildSettingItem("Summary", controller.summaryType, ImagePaths.chart),
      buildSettingItem(
          "Default currency", controller.defaultCurrency, ImagePaths.money),
    ]);
  }

  Widget buildAppearanceSection() {
    return buildCard([
      buildSettingItem("App icon", controller.appIcon, ImagePaths.appicon),
      buildSettingItem(
          "Theme", controller.themeMode, Icons.light_mode_outlined),
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
                ? Image.asset(icon,
                    width: 20.w, height: 20.h, color: ColorsApp.whiteapp)
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
