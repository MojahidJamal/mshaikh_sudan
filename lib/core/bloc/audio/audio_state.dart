import 'package:equatable/equatable.dart';
import '../../models/audio_model.dart';

class AudioState extends Equatable {
  final List<AudioModel> allAudios;
  final List<AudioModel> filteredAudios;
  final AudioModel? currentAudio;
  final List<String> favoriteAudioIds;

  const AudioState({
    this.allAudios = const [],
    this.filteredAudios = const [],
    this.currentAudio,
    this.favoriteAudioIds = const [],
  });

  AudioState copyWith({
    List<AudioModel>? allAudios,
    List<AudioModel>? filteredAudios,
    AudioModel? currentAudio,
    List<String>? favoriteAudioIds,
  }) {
    return AudioState(
      allAudios: allAudios ?? this.allAudios,
      filteredAudios: filteredAudios ?? this.filteredAudios,
      currentAudio: currentAudio ?? this.currentAudio,
      favoriteAudioIds: favoriteAudioIds ?? this.favoriteAudioIds,
    );
  }

  bool isFavorite(String audioId) {
    return favoriteAudioIds.contains(audioId);
  }

  @override
  List<Object?> get props => [allAudios, filteredAudios, currentAudio, favoriteAudioIds];
}
