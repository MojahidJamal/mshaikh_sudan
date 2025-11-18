import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';

/// Settings Screen - Placeholder for future settings
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الإعدادات',
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الإعدادات',
              style: textTheme.displayMedium!.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'قريباً: إعدادات التطبيق والمزيد',
              style: textTheme.labelLarge!.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            SizedBox(height: 32.h),
            _SettingsTile(
              icon: Icons.notifications_outlined,
              title: 'الإشعارات',
              subtitle: 'إدارة الإشعارات',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.download_outlined,
              title: 'التنزيلات',
              subtitle: 'إدارة الملفات المحملة',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.language_outlined,
              title: 'اللغة',
              subtitle: 'العربية',
              onTap: () {},
            ),
            _SettingsTile(
              icon: Icons.info_outline,
              title: 'عن التطبيق',
              subtitle: 'الإصدار 1.0.0',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget for settings tile
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.progressBackground.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryTextColor,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
