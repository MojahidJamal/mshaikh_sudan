import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/bloc/category/category_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/category/category_event.dart';
import 'package:mshaikh_sudan/core/bloc/category/category_state.dart';
import 'package:mshaikh_sudan/core/models/category_model.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';
import 'package:mshaikh_sudan/screens/sheikh_list/sheikh_list_screen.dart';

/// Screen displaying the three main categories:
/// تلاوات (Recitations), محاضرات (Lectures), أذكار (Adhkar)
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Load categories when screen is built
    context.read<CategoryBloc>().add(const LoadCategories());

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الأقسام',
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اختر القسم',
              style: textTheme.displayMedium!.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'استمع إلى مجموعة متنوعة من التلاوات والمحاضرات والأذكار',
              style: textTheme.labelLarge!.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return _CategoryCard(
                        category: category,
                        onTap: () {
                          context
                              .read<CategoryBloc>()
                              .add(SelectCategory(category));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SheikhListScreen(category: category),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget for displaying a category card
class _CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
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
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.progressBackground.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                offset: const Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon placeholder (using a circle with text since we don't have SVG icons yet)
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _getCategoryEmoji(category.id),
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.nameAr,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      category.description,
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
                size: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Get emoji based on category ID
  String _getCategoryEmoji(String categoryId) {
    switch (categoryId) {
      case 'recitations':
        return '📖';
      case 'lectures':
        return '🎙️';
      case 'adhkar':
        return '📿';
      default:
        return '📚';
    }
  }
}
