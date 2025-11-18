import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_event.dart';
import 'package:mshaikh_sudan/core/bloc/audio/audio_state.dart';
import 'package:mshaikh_sudan/core/bloc/audio_player/audio_player_bloc.dart';
import 'package:mshaikh_sudan/core/bloc/audio_player/audio_player_event.dart';
import 'package:mshaikh_sudan/core/bloc/audio_player/audio_player_state.dart';
import 'package:mshaikh_sudan/core/models/audio_model.dart';
import 'package:mshaikh_sudan/core/reusable_widgets/custom_appBar.dart';
import 'package:mshaikh_sudan/core/utils/app_colors.dart';

/// Audio Player Screen with full controls
class AudioPlayerScreen extends StatefulWidget {
  final AudioModel audio;
  final List<AudioModel> playlist;

  const AudioPlayerScreen({
    super.key,
    required this.audio,
    required this.playlist,
  });

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  void initState() {
    super.initState();
    // Start playing the audio when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AudioPlayerBloc>().add(PlayAudio(widget.audio));
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المشغل',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
            builder: (context, playerState) {
              return BlocBuilder<AudioBloc, AudioState>(
                builder: (context, audioState) {
                  final isFavorite = audioState.isFavorite(widget.audio.id);

                  return Column(
                    children: [
                      SizedBox(height: 40.h),
                      // Album art placeholder
                      Container(
                        width: 280.w,
                        height: 280.w,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withValues(alpha: 0.2),
                              offset: const Offset(0, 8),
                              blurRadius: 24,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background gradient
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.primaryColor.withValues(alpha: 0.3),
                                      AppColors.secondaryColor.withValues(alpha: 0.2),
                                    ],
                                  ),
                                ),
                              ),
                              // Icon
                              Icon(
                                Icons.music_note,
                                size: 120.sp,
                                color: AppColors.whiteColor.withValues(alpha: 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      // Track title
                      Text(
                        widget.audio.title,
                        style: textTheme.displayMedium!.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12.h),
                      // Track duration
                      Text(
                        widget.audio.formattedDuration,
                        style: textTheme.labelLarge!.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const Spacer(),
                      // Progress bar
                      _AudioProgressBar(
                        position: playerState.position,
                        duration: playerState.duration ?? widget.audio.duration,
                      ),
                      SizedBox(height: 32.h),
                      // Control buttons
                      _AudioControls(
                        isPlaying: playerState.isPlaying,
                        isLoading: playerState.isLoading,
                        onPlayPause: () {
                          if (playerState.isPlaying) {
                            context.read<AudioPlayerBloc>().add(const PauseAudio());
                          } else {
                            context.read<AudioPlayerBloc>().add(const ResumeAudio());
                          }
                        },
                        onPrevious: () {
                          // Navigate to previous track
                          final currentIndex = widget.playlist.indexOf(widget.audio);
                          if (currentIndex > 0) {
                            final previousAudio = widget.playlist[currentIndex - 1];
                            context.read<AudioPlayerBloc>().add(PlayAudio(previousAudio));
                          }
                        },
                        onNext: () {
                          // Navigate to next track
                          final currentIndex = widget.playlist.indexOf(widget.audio);
                          if (currentIndex < widget.playlist.length - 1) {
                            final nextAudio = widget.playlist[currentIndex + 1];
                            context.read<AudioPlayerBloc>().add(PlayAudio(nextAudio));
                          }
                        },
                        hasPrevious: widget.playlist.indexOf(widget.audio) > 0,
                        hasNext: widget.playlist.indexOf(widget.audio) < widget.playlist.length - 1,
                      ),
                      SizedBox(height: 24.h),
                      // Favorite button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<AudioBloc>().add(ToggleFavorite(widget.audio.id));
                            },
                            icon: Icon(
                              isFavorite ? Icons.bookmark : Icons.bookmark_border,
                              color: isFavorite
                                  ? AppColors.secondaryColor
                                  : AppColors.secondaryTextColor,
                              size: 32.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Stop audio when leaving the screen (optional)
    // You may want to keep it playing in the background
    super.dispose();
  }
}

/// Widget for audio progress bar
class _AudioProgressBar extends StatelessWidget {
  final Duration position;
  final Duration duration;

  const _AudioProgressBar({
    required this.position,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4.h,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
            activeTrackColor: AppColors.primaryColor,
            inactiveTrackColor: AppColors.progressBackground,
            thumbColor: AppColors.primaryColor,
            overlayColor: AppColors.primaryColor.withValues(alpha: 0.2),
          ),
          child: Slider(
            value: position.inSeconds.toDouble(),
            max: duration.inSeconds.toDouble(),
            onChanged: (value) {
              context.read<AudioPlayerBloc>().add(SeekAudio(Duration(seconds: value.toInt())));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(position),
                style: textTheme.labelSmall!.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
              Text(
                _formatDuration(duration),
                style: textTheme.labelSmall!.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

/// Widget for audio control buttons
class _AudioControls extends StatelessWidget {
  final bool isPlaying;
  final bool isLoading;
  final VoidCallback onPlayPause;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool hasPrevious;
  final bool hasNext;

  const _AudioControls({
    required this.isPlaying,
    required this.isLoading,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
    required this.hasPrevious,
    required this.hasNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous button
        IconButton(
          onPressed: hasPrevious ? onPrevious : null,
          icon: Icon(
            Icons.skip_previous_rounded,
            size: 48.sp,
            color: hasPrevious
                ? AppColors.whiteColor
                : AppColors.disabledColor,
          ),
        ),
        SizedBox(width: 24.w),
        // Play/Pause button
        Container(
          width: 72.w,
          height: 72.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.4),
                offset: const Offset(0, 4),
                blurRadius: 12,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: isLoading ? null : onPlayPause,
              borderRadius: BorderRadius.circular(36.r),
              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: CircularProgressIndicator(
                          color: AppColors.whiteColor,
                          strokeWidth: 3,
                        ),
                      )
                    : Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 40.sp,
                        color: AppColors.whiteColor,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(width: 24.w),
        // Next button
        IconButton(
          onPressed: hasNext ? onNext : null,
          icon: Icon(
            Icons.skip_next_rounded,
            size: 48.sp,
            color: hasNext
                ? AppColors.whiteColor
                : AppColors.disabledColor,
          ),
        ),
      ],
    );
  }
}
