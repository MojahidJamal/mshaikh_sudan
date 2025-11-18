import 'package:flutter_bloc/flutter_bloc.dart';
import 'audio_event.dart';
import 'audio_state.dart';
import '../../models/audio_model.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(const AudioState()) {
    on<LoadAudios>(_onLoadAudios);
    on<LoadAudiosBySheikh>(_onLoadAudiosBySheikh);
    on<SetCurrentAudio>(_onSetCurrentAudio);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onLoadAudios(LoadAudios event, Emitter<AudioState> emit) {
    final audios = AudioModel.getSampleAudios();
    emit(state.copyWith(allAudios: audios));
  }

  void _onLoadAudiosBySheikh(LoadAudiosBySheikh event, Emitter<AudioState> emit) {
    final filteredAudios = AudioModel.getAudiosBySheikh(event.sheikhId);
    emit(state.copyWith(filteredAudios: filteredAudios));
  }

  void _onSetCurrentAudio(SetCurrentAudio event, Emitter<AudioState> emit) {
    emit(state.copyWith(currentAudio: event.audio));
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<AudioState> emit) {
    final currentFavorites = List<String>.from(state.favoriteAudioIds);

    if (currentFavorites.contains(event.audioId)) {
      currentFavorites.remove(event.audioId);
    } else {
      currentFavorites.add(event.audioId);
    }

    emit(state.copyWith(favoriteAudioIds: currentFavorites));
  }
}
