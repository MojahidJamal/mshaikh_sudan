import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(
      0xFFBB86FC); // Accent color - use for play button, active icons, progress bar, etc.
  static Color secondaryColor = const Color(
      0xFF03DAC6); // Secondary accent - use for shuffle, repeat, or special actions.
  static Color backgroundColor = const Color(
      0xFF121212); // Main app background - use for Scaffold and screens.
  static Color surfaceColor = const Color(
      0xFF1E1E1E); // Surface background - cards, bottom sheet, player container.
  static Color whiteColor =
      const Color(0xFFFFFFFF); // Primary text - titles, main labels.
  static Color secondaryTextColor = const Color(
      0xFFB3B3B3); // Secondary text - artist name, duration, labels.
  static Color disabledColor =
      const Color(0xFF555555); // Disabled/inactive icons and buttons.
  static Color progressBackground =
      const Color(0xFF3E3E3E); // Unfilled progress bar or slider track.
  static Color iconColor =
      const Color(0xFFFFFFFF); // General icon color (neutral state).
  static Color scaffoldBackgroundColor = const Color(
      0xFF121212); // Scaffold background - same as backgroundColor for consistency.
  static Color grayText = const Color(0xFF737373); // placeholderText
  static const Color thirdColor = Color(0xFF8E8E93); // A subtle muted grey-blue
}
