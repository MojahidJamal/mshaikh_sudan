import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'audio_player_event.dart';
import 'audio_player_state.dart';
import '../../services/audio_player_service.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioPlayerService _audioPlayerService;
  StreamSubscription? _playingSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _durationSubscription;

  AudioPlayerBloc(this._audioPlayerService) : super(const AudioPlayerState()) {
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
    on<ResumeAudio>(_onResumeAudio);
    on<StopAudio>(_onStopAudio);
    on<SeekAudio>(_onSeekAudio);
    on<SetVolume>(_onSetVolume);
    on<UpdatePlayingState>(_onUpdatePlayingState);
    on<UpdatePosition>(_onUpdatePosition);
    on<UpdateDuration>(_onUpdateDuration);

    _initializeService();
    _listenToPlayerState();
  }

  void _initializeService() {
    _audioPlayerService.init();
  }

  void _listenToPlayerState() {
    _playingSubscription = _audioPlayerService.playingStream.listen((isPlaying) {
      add(UpdatePlayingState(isPlaying));
    });

    _positionSubscription = _audioPlayerService.positionStream.listen((position) {
      add(UpdatePosition(position));
    });

    _durationSubscription = _audioPlayerService.durationStream.listen((duration) {
      if (duration != null) {
        add(UpdateDuration(duration));
      }
    });
  }

  Future<void> _onPlayAudio(PlayAudio event, Emitter<AudioPlayerState> emit) async {
    if (event.audio.audioUrl == null) return;

    emit(state.copyWith(isLoading: true, currentAudio: event.audio));

    try {
      await _audioPlayerService.play(event.audio.audioUrl!);
      emit(state.copyWith(isLoading: false, isPlaying: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isPlaying: false));
      rethrow;
    }
  }

  Future<void> _onPauseAudio(PauseAudio event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayerService.pause();
  }

  Future<void> _onResumeAudio(ResumeAudio event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayerService.resume();
  }

  Future<void> _onStopAudio(StopAudio event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayerService.stop();
    emit(const AudioPlayerState());
  }

  Future<void> _onSeekAudio(SeekAudio event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayerService.seek(event.position);
  }

  Future<void> _onSetVolume(SetVolume event, Emitter<AudioPlayerState> emit) async {
    await _audioPlayerService.setVolume(event.volume);
  }

  void _onUpdatePlayingState(UpdatePlayingState event, Emitter<AudioPlayerState> emit) {
    emit(state.copyWith(isPlaying: event.isPlaying));
  }

  void _onUpdatePosition(UpdatePosition event, Emitter<AudioPlayerState> emit) {
    emit(state.copyWith(position: event.position));
  }

  void _onUpdateDuration(UpdateDuration event, Emitter<AudioPlayerState> emit) {
    emit(state.copyWith(duration: event.duration));
  }

  @override
  Future<void> close() {
    _playingSubscription?.cancel();
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _audioPlayerService.dispose();
    return super.close();
  }
}
