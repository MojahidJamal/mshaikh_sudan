import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/track_item_card.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';
import 'package:mshaikh_sudan/core/utils/common_image_view.dart';
import 'package:mshaikh_sudan/core/utils/image_constant.dart';
import 'package:mshaikh_sudan/screens/home_screen/widgets/most_popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'مشايخ',
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            const MostPopularWidget(),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'أبرز المشايخ',
                  style: textTheme.displayMedium!.copyWith(
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: Image.asset('assets/images/person.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'الشيخ ${index + 1}',
                            style: textTheme.headlineMedium!.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'مختارات متنوعة',
                  style: textTheme.displayMedium!.copyWith(
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            TrackItemContainer(
              leading: CommonImageView(
                svgPath: IconConstant.playIcon,
                height: 32.h,
                width: 32.w,
                color: AppColors.secondaryColor,
              ),
              title: 'Track Title',
              subtitle: '3:42',
              onTap: () {
                // Play the track
              },
              trailing: const Icon(
                Icons.bookmark_border_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            TrackItemContainer(
              leading: CommonImageView(
                svgPath: IconConstant.playIcon,
                height: 32.h,
                width: 32.w,
                color: AppColors.secondaryColor,
              ),
              title: 'Track Title',
              subtitle: '3:42',
              onTap: () {
                // Play the track
              },
              trailing: const Icon(
                Icons.bookmark_border_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
