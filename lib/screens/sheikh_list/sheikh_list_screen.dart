import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/bloc/sheikh/sheikh_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/sheikh/sheikh_event.dart';
import 'package:mshaikh_sudan/core/bloc/sheikh/sheikh_state.dart';
import 'package:mshaikh_sudan/core/models/category_model.dart';
import 'package:mshaikh_sudan/core/models/sheikh_model.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';
import 'package:mshaikh_sudan/screens/audio_list/audio_list_screen.dart';

/// Screen displaying list of Sheikhs for a specific category
class SheikhListScreen extends StatelessWidget {
  final CategoryModel category;

  const SheikhListScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => SheikhBloc()..add(LoadSheikhsByCategory(category.id)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: category.nameAr,
          showBackButton: true,
        ),
        body: BlocBuilder<SheikhBloc, SheikhState>(
          builder: (context, state) {
            final sheikhs = state.filteredSheikhs;

            return sheikhs.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_off,
                          size: 64.sp,
                          color: AppColors.secondaryTextColor,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'لا يوجد مشايخ في هذا القسم',
                          style: textTheme.bodyLarge!.copyWith(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    children: [
                      Text(
                        'اختر الشيخ',
                        style: textTheme.displayMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'استمع إلى ${category.nameAr} من مشايخ مختلفين',
                        style: textTheme.labelLarge!.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ...sheikhs.map((sheikh) => _SheikhCard(
                            sheikh: sheikh,
                            onTap: () {
                              context.read<SheikhBloc>().add(SelectSheikh(sheikh));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AudioListScreen(sheikh: sheikh),
                                ),
                              );
                            },
                          )),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

/// Widget for displaying a sheikh card
class _SheikhCard extends StatelessWidget {
  final SheikhModel sheikh;
  final VoidCallback onTap;

  const _SheikhCard({
    required this.sheikh,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.progressBackground.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              // Sheikh image
              Container(
                width: 70.w,
                height: 70.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    sheikh.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.progressBackground,
                        child: Icon(
                          Icons.person,
                          color: AppColors.secondaryTextColor,
                          size: 40.sp,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sheikh.name,
                      style: textTheme.titleMedium!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      sheikh.description,
                      style: textTheme.labelMedium!.copyWith(
                        color: AppColors.secondaryTextColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
