import 'package:equatable/equatable.dart';
import '../../models/audio_model.dart';

abstract class AudioPlayerEvent extends Equatable {
  const AudioPlayerEvent();

  @override
  List<Object?> get props => [];
}

class PlayAudio extends AudioPlayerEvent {
  final AudioModel audio;

  const PlayAudio(this.audio);

  @override
  List<Object?> get props => [audio];
}

class PauseAudio extends AudioPlayerEvent {
  const PauseAudio();
}

class ResumeAudio extends AudioPlayerEvent {
  const ResumeAudio();
}

class StopAudio extends AudioPlayerEvent {
  const StopAudio();
}

class SeekAudio extends AudioPlayerEvent {
  final Duration position;

  const SeekAudio(this.position);

  @override
  List<Object?> get props => [position];
}

class SetVolume extends AudioPlayerEvent {
  final double volume;

  const SetVolume(this.volume);

  @override
  List<Object?> get props => [volume];
}

class UpdatePlayingState extends AudioPlayerEvent {
  final bool isPlaying;

  const UpdatePlayingState(this.isPlaying);

  @override
  List<Object?> get props => [isPlaying];
}

class UpdatePosition extends AudioPlayerEvent {
  final Duration position;

  const UpdatePosition(this.position);

  @override
  List<Object?> get props => [position];
}

class UpdateDuration extends AudioPlayerEvent {
  final Duration? duration;

  const UpdateDuration(this.duration);

  @override
  List<Object?> get props => [duration];
}
