import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_event.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_state.dart';
import 'package:mshaikh_sudan/core/bloc/sheikh/sheikh_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/sheikh/sheikh_event.dart';
import 'package:mshaikh_sudan/core/bloc/sheikh/sheikh_state.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/track_item_card.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';
import 'package:mshaikh_sudan/core/utils/common_image_view.dart';
import 'package:mshaikh_sudan/core/utils/image_constant.dart';
import 'package:mshaikh_sudan/screens/audio_list/audio_list_screen.dart';
import 'package:mshaikh_sudan/screens/audio_player/audio_player_screen.dart';
import 'package:mshaikh_sudan/screens/home_screen/widgets/most_popular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
            BlocBuilder<SheikhBloc, SheikhState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.featuredSheikhs
                        .map((sheikh) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: InkWell(
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
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primaryColor
                                              .withValues(alpha: 0.4),
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          sheikh.imagePath,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
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
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      width: 80.w,
                                      child: Text(
                                        sheikh.name,
                                        style: textTheme.headlineMedium!.copyWith(
                                          color: AppColors.whiteColor,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                );
              },
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
            Expanded(
              child: BlocBuilder<AudioBloc, AudioState>(
                builder: (context, state) {
                  final recentAudios = state.allAudios.take(5).toList();

                  return ListView.builder(
                    itemCount: recentAudios.length,
                    itemBuilder: (context, index) {
                      final audio = recentAudios[index];
                      final isFavorite = state.isFavorite(audio.id);

                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: TrackItemContainer(
                          leading: CommonImageView(
                            svgPath: IconConstant.playIcon,
                            height: 32.h,
                            width: 32.w,
                            color: AppColors.secondaryColor,
                          ),
                          title: audio.title,
                          subtitle: audio.formattedDuration,
                          onTap: () {
                            context.read<AudioBloc>().add(SetCurrentAudio(audio));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioPlayerScreen(
                                  audio: audio,
                                  playlist: state.allAudios,
                                ),
                              ),
                            );
                          },
                          trailing: IconButton(
                            onPressed: () {
                              context.read<AudioBloc>().add(ToggleFavorite(audio.id));
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.bookmark
                                  : Icons.bookmark_border_rounded,
                              color: isFavorite
                                  ? AppColors.secondaryColor
                                  : Colors.white,
                            ),
                          ),
                        ),
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
