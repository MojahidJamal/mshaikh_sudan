import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

/// Service to manage audio playback using just_audio
class AudioPlayerService {
  static final AudioPlayerService _instance = AudioPlayerService._internal();
  factory AudioPlayerService() => _instance;
  AudioPlayerService._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get player => _audioPlayer;

  /// Initialize audio session
  Future<void> init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  /// Play audio from URL
  Future<void> play(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {
      throw Exception('Error playing audio: $e');
    }
  }

  /// Pause audio
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  /// Resume audio
  Future<void> resume() async {
    await _audioPlayer.play();
  }

  /// Stop audio
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  /// Seek to position
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  /// Set volume (0.0 to 1.0)
  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  /// Get current position stream
  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  /// Get duration stream
  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  /// Get playing state stream
  Stream<bool> get playingStream => _audioPlayer.playingStream;

  /// Get player state stream
  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;

  /// Dispose player
  void dispose() {
    _audioPlayer.dispose();
  }
}
