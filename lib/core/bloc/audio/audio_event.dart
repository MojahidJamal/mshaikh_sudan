import 'package:equatable/equatable.dart';
import '../../models/audio_model.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object?> get props => [];
}

class LoadAudios extends AudioEvent {
  const LoadAudios();
}

class LoadAudiosBySheikh extends AudioEvent {
  final String sheikhId;

  const LoadAudiosBySheikh(this.sheikhId);

  @override
  List<Object?> get props => [sheikhId];
}

class SetCurrentAudio extends AudioEvent {
  final AudioModel? audio;

  const SetCurrentAudio(this.audio);

  @override
  List<Object?> get props => [audio];
}

class ToggleFavorite extends AudioEvent {
  final String audioId;

  const ToggleFavorite(this.audioId);

  @override
  List<Object?> get props => [audioId];
}
