import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.almarai().fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundColor, // Main app background
    primaryColor: AppColors.primaryColor, // Accent color
    hintColor: AppColors.secondaryTextColor, // Placeholder or hint text

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceColor, // Dark surface for app bar
      foregroundColor: AppColors.whiteColor, // App bar icons and text
      centerTitle: true,
      scrolledUnderElevation: 0.0,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
      unselectedIconTheme: IconThemeData(color: AppColors.secondaryTextColor),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryTextColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),

    dividerTheme: DividerThemeData(
      thickness: 0.5,
      color: AppColors.progressBackground, // Divider and subtle borders
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor, // Loader color
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        overlayColor: AppColors.primaryColor.withOpacity(0.1),
      ),
    ),

    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
}

InputDecorationTheme get _inputDecorationTheme {
  return InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceColor, // Input background
    hintStyle: TextStyle(color: AppColors.secondaryTextColor),
    border: _enabledBorder,
    enabledBorder: _enabledBorder,
    focusedBorder: _focusedBorder,
    disabledBorder: _disabledBorder,
  );
}

FilledButtonThemeData get _filledButtonTheme {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  );
}

OutlinedButtonThemeData get _outlinedButtonTheme {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.surfaceColor,
      side: BorderSide(color: AppColors.primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  );
}

InputBorder get _enabledBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: AppColors.progressBackground),
    );

InputBorder get _focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: AppColors.primaryColor),
    );

InputBorder get _disabledBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide:
          BorderSide(color: AppColors.progressBackground.withOpacity(0.3)),
    );
