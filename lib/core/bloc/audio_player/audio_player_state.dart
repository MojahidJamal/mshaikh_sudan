import 'package:equatable/equatable.dart';
import '../../models/audio_model.dart';

class AudioPlayerState extends Equatable {
  final AudioModel? currentAudio;
  final bool isPlaying;
  final Duration position;
  final Duration? duration;
  final bool isLoading;

  const AudioPlayerState({
    this.currentAudio,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration,
    this.isLoading = false,
  });

  AudioPlayerState copyWith({
    AudioModel? currentAudio,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    bool? isLoading,
  }) {
    return AudioPlayerState(
      currentAudio: currentAudio ?? this.currentAudio,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [currentAudio, isPlaying, position, duration, isLoading];
}
