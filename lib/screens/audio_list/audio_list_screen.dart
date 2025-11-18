import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_event.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_state.dart';
import 'package:mshaikh_sudan/core/models/audio_model.dart';
import 'package:mshaikh_sudan/core/models/sheikh_model.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';
import 'package:mshaikh_sudan/core/utils/common_image_view.dart';
import 'package:mshaikh_sudan/core/utils/image_constant.dart';
import 'package:mshaikh_sudan/screens/audio_player/audio_player_screen.dart';

/// Screen displaying list of audio tracks for a specific Sheikh
class AudioListScreen extends StatelessWidget {
  final SheikhModel sheikh;

  const AudioListScreen({
    super.key,
    required this.sheikh,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => AudioBloc()..add(LoadAudiosBySheikh(sheikh.id)),
      child: BlocBuilder<AudioBloc, AudioState>(
        builder: (context, state) {
          final audios = state.filteredAudios;

          return Scaffold(
            appBar: CustomAppBar(
              title: sheikh.name,
              showBackButton: true,
            ),
            body: audios.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.music_off,
                          size: 64.sp,
                          color: AppColors.secondaryTextColor,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'لا توجد تسجيلات متاحة',
                          style: textTheme.bodyLarge!.copyWith(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      // Sheikh header
                      Container(
                        padding: EdgeInsets.all(20.w),
                        color: AppColors.surfaceColor,
                        child: Row(
                          children: [
                            Container(
                              width: 80.w,
                              height: 80.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryColor.withValues(alpha: 0.5),
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
                                    style: textTheme.titleLarge!.copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    sheikh.description,
                                    style: textTheme.labelMedium!.copyWith(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    '${audios.length} تسجيل',
                                    style: textTheme.labelSmall!.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Audio list
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: audios.length,
                          itemBuilder: (context, index) {
                            final audio = audios[index];
                            return _AudioTrackItem(
                              audio: audio,
                              index: index,
                              onTap: () {
                                context.read<AudioBloc>().add(SetCurrentAudio(audio));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AudioPlayerScreen(
                                      audio: audio,
                                      playlist: audios,
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
          );
        },
      ),
    );
  }
}

/// Widget for displaying an audio track item
class _AudioTrackItem extends StatelessWidget {
  final AudioModel audio;
  final int index;
  final VoidCallback onTap;

  const _AudioTrackItem({
    required this.audio,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        final isFavorite = state.isFavorite(audio.id);

        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Play icon
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: CommonImageView(
                        svgPath: IconConstant.playIcon,
                        height: 24.h,
                        width: 24.w,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Track info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          audio.title,
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          audio.formattedDuration,
                          style: textTheme.labelMedium!.copyWith(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Favorite button
                  IconButton(
                    onPressed: () {
                      context.read<AudioBloc>().add(ToggleFavorite(audio.id));
                    },
                    icon: Icon(
                      isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      color: isFavorite
                          ? AppColors.secondaryColor
                          : AppColors.secondaryTextColor,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
