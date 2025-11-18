# مشايخ السودان - Islamic Audio App

An elegant Islamic audio application built with Flutter, featuring Quranic recitations, Islamic lectures, and Adhkar (remembrances).

## 📱 Features

### Core Functionality
- **Three Main Categories:**
  - 📖 **تلاوات (Recitations)** - Quranic recitations from renowned Sheikhs
  - 🎙️ **محاضرات (Lectures)** - Islamic lectures and lessons
  - 📿 **أذكار (Adhkar)** - Daily remembrances and supplications

- **Audio Playback:**
  - Full-featured audio player with play, pause, seek controls
  - Next/Previous track navigation
  - Beautiful progress bar with time display
  - Playlist support

- **User Features:**
  - Browse Sheikhs by category
  - View audio collections per Sheikh
  - Bookmark favorite tracks
  - Featured Sheikhs section on home screen
  - Recent audio selections

## 🏗️ Architecture

The app follows clean Flutter architecture with clear separation of concerns:

```
lib/
├── core/
│   ├── models/           # Data models (Category, Sheikh, Audio)
│   ├── providers/        # Riverpod state management
│   ├── services/         # Audio player service
│   ├── reusable_widgets/ # Shared UI components
│   └── utils/            # Colors, constants, helpers
├── config/
│   └── themes/           # App theme configuration
└── screens/
    ├── audio_list/       # Audio list screen
    ├── audio_player/     # Audio player screen
    ├── categories/       # Categories screen
    ├── home_screen/      # Home screen
    ├── settings/         # Settings screen
    ├── sheikh_list/      # Sheikh list screen
    └── splash/           # Splash screen
```

## 🎨 Design

- **Dark Theme:** Elegant dark mode with carefully chosen colors
- **RTL Support:** Full right-to-left support for Arabic
- **Custom Font:** Almarai font family for beautiful Arabic typography
- **Responsive:** Built with flutter_screenutil for consistent sizing
- **Material 3:** Modern Material Design 3 components

### Color Scheme
- Primary: Purple (#BB86FC)
- Secondary: Teal (#03DAC6)
- Background: Dark (#121212)
- Surface: Dark Gray (#1E1E1E)

## 📦 Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.6.1      # State management
  just_audio: ^0.9.42           # Audio playback
  audio_session: ^0.1.21        # Audio session management
  rxdart: ^0.28.0               # Reactive programming
  flutter_screenutil: ^5.9.3    # Responsive design
  google_fonts: ^6.2.1          # Almarai font
  flutter_svg: ^2.0.17          # SVG support
  cached_network_image: ^3.4.1  # Image caching
  flutter_easyloading: 3.0.3    # Loading indicators
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.5.3 or higher)
- Dart SDK (included with Flutter)
- iOS: Xcode 15 or higher
- Android: Android Studio with SDK 21+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/mshaikh_sudan.git
cd mshaikh_sudan
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📝 State Management

The app uses **Riverpod** for state management with the following providers:

- `categoriesProvider` - Manages app categories
- `sheikhsProvider` - Manages Sheikh data
- `audiosProvider` - Manages audio tracks
- `audioPlayerProvider` - Controls audio playback state
- `favoriteAudiosProvider` - Manages user favorites

## 🎵 Audio Service

The audio playback is handled by `AudioPlayerService` which wraps `just_audio`:

- Singleton pattern for global access
- Stream-based state updates
- Position, duration, and playing state tracking
- Seek, play, pause, stop controls

## 📂 Data Models

### CategoryModel
Represents main app categories (Recitations, Lectures, Adhkar)

### SheikhModel
Represents Islamic scholars/reciters with:
- Name, image, description
- Category association
- Featured flag

### AudioModel
Represents audio tracks with:
- Title, duration, URL
- Sheikh association
- Favorite/downloaded status

## 🎯 Navigation Flow

```
Splash Screen
    ↓
Main Nav Bar (3 tabs)
    ├── Home Screen
    │   ├── Featured Sheikhs → Audio List → Audio Player
    │   └── Recent Audios → Audio Player
    ├── Categories Screen
    │   └── Category → Sheikh List → Audio List → Audio Player
    └── Settings Screen
```

## 🔄 Future Enhancements

- [ ] Download audio for offline playback
- [ ] Search functionality
- [ ] Audio playback in background
- [ ] Share audio tracks
- [ ] User authentication
- [ ] Cloud sync for favorites
- [ ] Playback speed control
- [ ] Sleep timer
- [ ] Create custom playlists
- [ ] Statistics and listening history

## 🧪 Testing

Currently the app uses sample data. To integrate with a real backend:

1. Update the model classes to parse API responses
2. Replace static `getSample*()` methods with API calls
3. Add repository layer for data management
4. Implement error handling and loading states

## 📱 Supported Platforms

- ✅ iOS
- ✅ Android
- 🔄 Web (upcoming)
- 🔄 macOS (upcoming)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is private and not licensed for public use.

## 👨‍💻 Developer Notes

### Code Style
- Follow Flutter/Dart best practices
- Use meaningful variable names
- Add comments for complex logic
- Keep widgets small and focused
- Prefer composition over inheritance

### Widget Guidelines
- Use `const` constructors when possible
- Extract reusable widgets to separate files
- Use proper widget keys for list items
- Handle null safety properly

### Performance Tips
- Use `const` widgets
- Implement proper dispose methods
- Avoid unnecessary rebuilds
- Use ListView.builder for long lists
- Cache images with cached_network_image

---

Built with ❤️ using Flutter
