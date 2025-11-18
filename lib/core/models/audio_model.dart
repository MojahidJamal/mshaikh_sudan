/// Model representing an audio track
class AudioModel {
  final String id;
  final String title;
  final String sheikhId; // Links to Sheikh
  final String? audioUrl; // URL or local path
  final Duration duration;
  final String? description;
  final bool isDownloaded;
  final bool isFavorite;

  AudioModel({
    required this.id,
    required this.title,
    required this.sheikhId,
    this.audioUrl,
    required this.duration,
    this.description,
    this.isDownloaded = false,
    this.isFavorite = false,
  });

  /// Format duration as mm:ss
  String get formattedDuration {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  /// Sample data - Replace with real data from API or local storage
  static List<AudioModel> getSampleAudios() {
    return [
      // Recitations for Sheikh 1
      AudioModel(
        id: 'audio_1',
        title: 'سورة البقرة',
        sheikhId: 'sheikh_1',
        audioUrl: 'https://example.com/audio1.mp3',
        duration: const Duration(minutes: 45, seconds: 30),
        description: 'تلاوة خاشعة لسورة البقرة',
      ),
      AudioModel(
        id: 'audio_2',
        title: 'سورة آل عمران',
        sheikhId: 'sheikh_1',
        audioUrl: 'https://example.com/audio2.mp3',
        duration: const Duration(minutes: 32, seconds: 15),
        description: 'تلاوة سورة آل عمران',
      ),
      AudioModel(
        id: 'audio_3',
        title: 'سورة يس',
        sheikhId: 'sheikh_1',
        audioUrl: 'https://example.com/audio3.mp3',
        duration: const Duration(minutes: 12, seconds: 45),
      ),

      // Recitations for Sheikh 2
      AudioModel(
        id: 'audio_4',
        title: 'سورة الرحمن',
        sheikhId: 'sheikh_2',
        audioUrl: 'https://example.com/audio4.mp3',
        duration: const Duration(minutes: 8, seconds: 20),
      ),
      AudioModel(
        id: 'audio_5',
        title: 'سورة الواقعة',
        sheikhId: 'sheikh_2',
        audioUrl: 'https://example.com/audio5.mp3',
        duration: const Duration(minutes: 10, seconds: 30),
      ),

      // Recitations for Sheikh 3
      AudioModel(
        id: 'audio_6',
        title: 'سورة الكهف',
        sheikhId: 'sheikh_3',
        audioUrl: 'https://example.com/audio6.mp3',
        duration: const Duration(minutes: 25, seconds: 10),
      ),

      // Lectures for Sheikh 4
      AudioModel(
        id: 'audio_7',
        title: 'محاضرة: الصبر على البلاء',
        sheikhId: 'sheikh_4',
        audioUrl: 'https://example.com/audio7.mp3',
        duration: const Duration(minutes: 42, seconds: 0),
      ),
      AudioModel(
        id: 'audio_8',
        title: 'محاضرة: فضل الصلاة',
        sheikhId: 'sheikh_4',
        audioUrl: 'https://example.com/audio8.mp3',
        duration: const Duration(minutes: 38, seconds: 15),
      ),

      // Lectures for Sheikh 5
      AudioModel(
        id: 'audio_9',
        title: 'درس: التوبة والإنابة',
        sheikhId: 'sheikh_5',
        audioUrl: 'https://example.com/audio9.mp3',
        duration: const Duration(minutes: 35, seconds: 45),
      ),

      // Adhkar for Sheikh 6
      AudioModel(
        id: 'audio_10',
        title: 'أذكار الصباح',
        sheikhId: 'sheikh_6',
        audioUrl: 'https://example.com/audio10.mp3',
        duration: const Duration(minutes: 15, seconds: 30),
      ),
      AudioModel(
        id: 'audio_11',
        title: 'أذكار المساء',
        sheikhId: 'sheikh_6',
        audioUrl: 'https://example.com/audio11.mp3',
        duration: const Duration(minutes: 14, seconds: 20),
      ),
      AudioModel(
        id: 'audio_12',
        title: 'أذكار النوم',
        sheikhId: 'sheikh_6',
        audioUrl: 'https://example.com/audio12.mp3',
        duration: const Duration(minutes: 8, seconds: 10),
      ),
    ];
  }

  /// Get audios by sheikh ID
  static List<AudioModel> getAudiosBySheikh(String sheikhId) {
    return getSampleAudios()
        .where((audio) => audio.sheikhId == sheikhId)
        .toList();
  }

  /// Copy with method for state updates
  AudioModel copyWith({
    String? id,
    String? title,
    String? sheikhId,
    String? audioUrl,
    Duration? duration,
    String? description,
    bool? isDownloaded,
    bool? isFavorite,
  }) {
    return AudioModel(
      id: id ?? this.id,
      title: title ?? this.title,
      sheikhId: sheikhId ?? this.sheikhId,
      audioUrl: audioUrl ?? this.audioUrl,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
