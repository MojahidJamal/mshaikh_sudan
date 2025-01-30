import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 4,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
        unselectedIconTheme: IconThemeData(color: AppColors.whiteColor)),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    hintColor: AppColors.hintColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.whiteColor,
        centerTitle: true,
        scrolledUnderElevation: 0.0),
    dividerTheme: DividerThemeData(
      thickness: 0.7,
      color: AppColors.gray20,
    ),
    progressIndicatorTheme:
    ProgressIndicatorThemeData(color: AppColors.primaryColor),
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
            foregroundColor: AppColors.whiteColor,
            overlayColor: AppColors.whiteColor)),
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
        //selectionColor: AppColors.greyColor,
        selectionHandleColor: AppColors.primaryColor),
  );
}

InputDecorationTheme get _inputDecorationTheme {
  return InputDecorationTheme(
    filled: true,
    fillColor: AppColors.whiteColor,
    border:
    OutlineInputBorder(borderSide: BorderSide(color: AppColors.grayText)),
    enabledBorder: _enabledBorder,
    focusedBorder: _focusedBorder,
    disabledBorder: _disabledBorder,
  );
}

FilledButtonThemeData get _filledButtonTheme {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  );
}

OutlinedButtonThemeData get _outlinedButtonTheme {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      overlayColor: AppColors.whiteColor,
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: AppColors.primaryColor)),
    ),
  );
}

InputBorder get _enabledBorder => OutlineInputBorder(
  borderRadius: BorderRadius.circular(4.0),
  borderSide: const BorderSide(color: Colors.transparent),
);

InputBorder get _focusedBorder => OutlineInputBorder(
  borderRadius: BorderRadius.circular(4.0),
  borderSide: BorderSide.none,
);

InputBorder get _disabledBorder => OutlineInputBorder(
  borderRadius: BorderRadius.circular(4.0),
  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
);