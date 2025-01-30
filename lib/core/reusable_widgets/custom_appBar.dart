import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

AppBar customAppBar(VoidCallback onTap, List<Widget>? actions, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    // AppBar Background Color
    elevation: 0,
    // Remove Shadow
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.grey.shade800, size: 28),
      // ☰ Menu Icon
      onPressed: () {
// Open Drawer or Perform Action
      },
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor, // Dark Green/Black Text
      ),
    ),
    centerTitle: false,
    // Align title to the left
    actions: actions ?? [],
  );
}