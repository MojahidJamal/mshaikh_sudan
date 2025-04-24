import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';
import 'package:mshaikh_sudan/core/utils/common_image_view.dart';
import 'package:mshaikh_sudan/core/utils/image_constant.dart';
import 'package:mshaikh_sudan/screens/home_screen/views/home_view.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  _MainNavBarState createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNavPage(_selectedIndex),
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.thirdColor.withOpacity(0.2)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.surfaceColor,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.thirdColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: CommonImageView(
                svgPath: IconConstant.homeTapIcon,
                color: AppColors.secondaryColor,
                width: 26.w,
                height: 26.w,
              ),
              icon: CommonImageView(
                svgPath: IconConstant.homeTapIcon,
                color: AppColors.thirdColor,
                width: 26.w,
                height: 26.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CommonImageView(
                svgPath: IconConstant.folderTapIcon,
                color: AppColors.secondaryColor,
                width: 26.w,
                height: 26.w,
              ),
              icon: CommonImageView(
                svgPath: IconConstant.folderTapIcon,
                color: AppColors.thirdColor,
                width: 26.w,
                height: 26.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CommonImageView(
                svgPath: IconConstant.settingTapIcon,
                color: AppColors.secondaryColor,
                width: 26.w,
                height: 26.w,
              ),
              icon: CommonImageView(
                svgPath: IconConstant.settingTapIcon,
                color: AppColors.thirdColor,
                width: 26.w,
                height: 26.w,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavPage(int index) {
    List<Widget> pages = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
    return pages[index];
  }
}
