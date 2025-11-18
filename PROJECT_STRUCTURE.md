# Project Structure Documentation

## 📁 Directory Overview

```
mshaikh_sudan/
├── lib/
│   ├── config/
│   │   └── themes/
│   │       └── app_theme.dart                    # App theme configuration (Material 3)
│   │
│   ├── core/
│   │   ├── bloc/
│   │   │   ├── audio/
│   │   │   │   ├── audio_bloc.dart               # Audio business logic
│   │   │   │   ├── audio_event.dart              # Audio events
│   │   │   │   └── audio_state.dart              # Audio state
│   │   │   │
│   │   │   ├── audio_player/
│   │   │   │   ├── audio_player_bloc.dart        # Audio player business logic
│   │   │   │   ├── audio_player_event.dart       # Audio player events
│   │   │   │   └── audio_player_state.dart       # Audio player state
│   │   │   │
│   │   │   ├── category/
│   │   │   │   ├── category_bloc.dart            # Category business logic
│   │   │   │   ├── category_event.dart           # Category events
│   │   │   │   └── category_state.dart           # Category state
│   │   │   │
│   │   │   └── sheikh/
│   │   │       ├── sheikh_bloc.dart              # Sheikh business logic
│   │   │       ├── sheikh_event.dart             # Sheikh events
│   │   │       └── sheikh_state.dart             # Sheikh state
│   │   │
│   │   ├── models/
│   │   │   ├── audio_model.dart                  # Audio track model
│   │   │   ├── category_model.dart               # Category model (تلاوات, محاضرات, أذكار)
│   │   │   └── sheikh_model.dart                 # Sheikh model
│   │   │
│   │   ├── reusable_widgets/
│   │   │   ├── custom_appBar.dart                # Reusable app bar
│   │   │   ├── home_cards_style.dart             # Home card styles
│   │   │   └── track_item_card.dart              # Audio track list item
│   │   │
│   │   ├── services/
│   │   │   └── audio_player_service.dart         # just_audio wrapper service
│   │   │
│   │   └── utils/
│   │       ├── app_colors.dart                   # Color constants
│   │       ├── common_image_view.dart            # Image widget helper
│   │       └── image_constant.dart               # Asset path constants
│   │
│   ├── screens/
│   │   ├── audio_list/
│   │   │   └── audio_list_screen.dart            # Audio list for a Sheikh
│   │   │
│   │   ├── audio_player/
│   │   │   └── audio_player_screen.dart          # Full audio player
│   │   │
│   │   ├── categories/
│   │   │   └── categories_screen.dart            # Main categories screen
│   │   │
│   │   ├── home_screen/
│   │   │   ├── views/
│   │   │   │   ├── home_view.dart                # Home tab content
│   │   │   │   └── main_nav_bar_view.dart        # Bottom navigation bar
│   │   │   └── widgets/
│   │   │       └── most_popular.dart             # Carousel widget
│   │   │
│   │   ├── settings/
│   │   │   └── settings_screen.dart              # Settings screen
│   │   │
│   │   ├── sheikh_list/
│   │   │   └── sheikh_list_screen.dart           # Sheikh list for a category
│   │   │
│   │   └── splash/
│   │       └── splash_screen.dart                # Splash screen
│   │
│   ├── main.dart                                 # App entry point
│   └── mskaikh_app.dart                          # Root MaterialApp widget
│
├── assets/
│   ├── icons/
│   │   ├── folder.svg                            # Categories icon
│   │   ├── home.svg                              # Home icon
│   │   ├── play_circle_icon.svg                  # Play icon
│   │   └── setting.svg                           # Settings icon
│   │
│   └── images/
│       ├── azkar_msa.jpg                         # Adhkar banner image
│       ├── azkar_sabah.jpg                       # Morning adhkar banner
│       ├── Group.png                             # Group image
│       ├── person.jpg                            # Default sheikh image
│       └── sbha.png                              # Tasbih image
│
├── test/
│   └── widget_test.dart                          # Widget tests
│
├── pubspec.yaml                                  # Dependencies & assets
├── README.md                                     # Project documentation
└── PROJECT_STRUCTURE.md                          # This file

```

## 🧩 Key Components

### 1. Data Layer (Models)

#### CategoryModel
```dart
- id: String
- nameAr: String
- description: String
- iconPath: String
```

#### SheikhModel
```dart
- id: String
- name: String
- imagePath: String
- categoryId: String
- description: String
- isFeatured: bool
```

#### AudioModel
```dart
- id: String
- title: String
- sheikhId: String
- audioUrl: String
- duration: Duration
- description: String?
- isDownloaded: bool
- isFavorite: bool
```

### 2. State Management (BLoC Pattern)

#### CategoryBloc
**Events:**
- `LoadCategories` - Load all categories
- `SelectCategory` - Select a category

**State:**
```dart
- categories: List<CategoryModel>
- selectedCategory: CategoryModel?
```

#### SheikhBloc
**Events:**
- `LoadSheikhs` - Load all sheikhs
- `LoadFeaturedSheikhs` - Load featured sheikhs
- `LoadSheikhsByCategory` - Load sheikhs by category
- `SelectSheikh` - Select a sheikh

**State:**
```dart
- allSheikhs: List<SheikhModel>
- featuredSheikhs: List<SheikhModel>
- filteredSheikhs: List<SheikhModel>
- selectedSheikh: SheikhModel?
```

#### AudioBloc
**Events:**
- `LoadAudios` - Load all audios
- `LoadAudiosBySheikh` - Load audios by sheikh
- `SetCurrentAudio` - Set current playing audio
- `ToggleFavorite` - Toggle audio favorite status

**State:**
```dart
- allAudios: List<AudioModel>
- filteredAudios: List<AudioModel>
- currentAudio: AudioModel?
- favoriteAudioIds: List<String>
```

#### AudioPlayerBloc
**Events:**
- `PlayAudio` - Play an audio track
- `PauseAudio` - Pause playback
- `ResumeAudio` - Resume playback
- `StopAudio` - Stop playback
- `SeekAudio` - Seek to position
- `SetVolume` - Set volume
- `UpdatePlayingState` - Update playing state (internal)
- `UpdatePosition` - Update position (internal)
- `UpdateDuration` - Update duration (internal)

**State:**
```dart
- currentAudio: AudioModel?
- isPlaying: bool
- position: Duration
- duration: Duration?
- isLoading: bool
```

### 3. Service Layer

#### AudioPlayerService
Singleton service wrapping `just_audio`:
- Manages audio playback lifecycle
- Provides streams for position, duration, and playing state
- Handles audio session configuration
- Used by AudioPlayerBloc

### 4. Screens Flow

```
┌─────────────────┐
│  Splash Screen  │
└────────┬────────┘
         │
         v
┌─────────────────────────────────────────┐
│         Main Navigation Bar             │
│  ┌──────┬──────────────┬─────────────┐  │
│  │ Home │  Categories  │  Settings   │  │
│  └──┬───┴──────┬───────┴──────┬──────┘  │
└────│──────────│──────────────│──────────┘
     │          │              │
     v          v              v
┌─────────┐  ┌────────────┐  ┌──────────┐
│  Home   │  │Categories  │  │ Settings │
│ Screen  │  │  Screen    │  │  Screen  │
└────┬────┘  └─────┬──────┘  └──────────┘
     │             │
     │             v
     │      ┌────────────────┐
     │      │  Sheikh List   │
     │      │    Screen      │
     │      └────────┬───────┘
     │               │
     v               v
┌────────────────────────────┐
│    Audio List Screen       │
└─────────────┬──────────────┘
              │
              v
┌────────────────────────────┐
│   Audio Player Screen      │
└────────────────────────────┘
```

## 🎨 Design System

### Color Palette
```dart
primaryColor:        #BB86FC  // Purple - accent actions
secondaryColor:      #03DAC6  // Teal - secondary actions
backgroundColor:     #121212  // Dark - main background
surfaceColor:        #1E1E1E  // Dark gray - cards/surfaces
whiteColor:          #FFFFFF  // White - primary text
secondaryTextColor:  #B3B3B3  // Gray - secondary text
disabledColor:       #555555  // Dark gray - disabled state
progressBackground:  #3E3E3E  // Gray - unfilled progress
```

### Typography (Almarai Font)
- Display Large: 24sp, Bold
- Display Medium: 20sp, Bold
- Display Small: 16sp, Bold
- Title Large: 20sp, SemiBold
- Body Large: 15sp, SemiBold
- Label Large: 14sp, Regular

### Spacing
Using `flutter_screenutil` for responsive sizing:
- Small: 8.w/8.h
- Medium: 16.w/16.h
- Large: 24.w/24.h
- XLarge: 32.w/32.h

### Border Radius
- Small: 8
- Medium: 12
- Large: 16
- XLarge: 20

## 📦 Dependencies Overview

### State Management
- **flutter_bloc** (^8.1.6): BLoC state management pattern
- **equatable** (^2.0.5): Value equality for BLoC states

### Audio
- **just_audio** (^0.9.42): Audio playback
- **audio_session** (^0.1.21): Audio session management
- **rxdart** (^0.28.0): Reactive extensions for Dart

### UI
- **flutter_screenutil** (^5.9.3): Responsive sizing
- **google_fonts** (^6.2.1): Almarai font
- **flutter_svg** (^2.0.17): SVG rendering
- **cached_network_image** (^3.4.1): Image caching
- **flutter_easyloading** (3.0.3): Loading indicators

## 🔄 Data Flow

### BLoC Architecture Pattern
```
┌─────────────┐
│     UI      │  Triggers events, displays state
│   (Widget)  │
└──────┬──────┘
       │ Event
       v
┌─────────────┐
│    BLoC     │  Processes events, emits states
│  (Business  │
│    Logic)   │
└──────┬──────┘
       │ State
       v
┌─────────────┐
│     UI      │  Rebuilds with new state
│  (Updated)  │
└─────────────┘
```

### Playing Audio Flow
```
User taps audio in list
    ↓
AudioListScreen adds SetCurrentAudio event
    ↓
Navigate to AudioPlayerScreen with audio & playlist
    ↓
AudioPlayerScreen adds PlayAudio event
    ↓
AudioPlayerBloc processes event → calls AudioPlayerService.play()
    ↓
Service streams update (position, duration, playing state)
    ↓
AudioPlayerBloc adds internal events (UpdatePosition, UpdateDuration, etc.)
    ↓
AudioPlayerBloc emits new state
    ↓
AudioPlayerScreen (BlocBuilder) rebuilds with new state
```

### Favoriting Audio Flow
```
User taps favorite button
    ↓
Widget adds ToggleFavorite event to AudioBloc
    ↓
AudioBloc processes event → updates favoriteAudioIds list
    ↓
AudioBloc emits new state with updated favorites
    ↓
All BlocBuilders watching AudioBloc rebuild
```

### Category Selection Flow
```
User taps category card
    ↓
CategoriesScreen adds SelectCategory event to CategoryBloc
    ↓
CategoryBloc updates selectedCategory in state
    ↓
Navigate to SheikhListScreen with category
    ↓
SheikhListScreen creates scoped SheikhBloc
    ↓
Adds LoadSheikhsByCategory event with category.id
    ↓
SheikhBloc filters sheikhs and emits state
    ↓
BlocBuilder displays filtered sheikhs
```

## 🏗️ BLoC Best Practices Used

### 1. Global vs Scoped BLoCs
- **Global BLoCs** (in main.dart):
  - CategoryBloc, SheikhBloc, AudioBloc, AudioPlayerBloc
  - Persist throughout app lifetime
  - Shared across multiple screens

- **Scoped BLoCs**:
  - AudioListScreen creates its own AudioBloc for filtering
  - SheikhListScreen creates its own SheikhBloc for filtering
  - Disposed when screen is popped

### 2. Immutable States
- All states use `copyWith()` method
- States extend Equatable for value comparison
- Prevents unnecessary rebuilds

### 3. Event-Driven Architecture
- UI only emits events
- BLoC processes events asynchronously
- State changes are predictable and testable

### 4. Stream Management
- AudioPlayerBloc subscribes to AudioPlayerService streams
- Properly disposes subscriptions in `close()` method
- Prevents memory leaks

## 🚀 Future Improvements

### Architecture
- [ ] Add repository layer for data abstraction
- [ ] Implement dependency injection (get_it)
- [ ] Add error handling with result types
- [ ] Implement local database (Hive/SQLite)
- [ ] Add offline-first architecture

### BLoC Enhancements
- [ ] Add loading states for async operations
- [ ] Implement error states and error handling
- [ ] Add undo/redo functionality
- [ ] Create reusable BLoC observers for logging

### Features
- [ ] Offline audio downloads
- [ ] Background audio playback with notifications
- [ ] Search with filters
- [ ] Custom playlists
- [ ] Audio queue management
- [ ] Sleep timer
- [ ] Playback speed control
- [ ] Audio bookmarks

### Testing
- [ ] Unit tests for BLoCs
- [ ] Unit tests for models
- [ ] Widget tests for screens
- [ ] Integration tests for flows
- [ ] Golden tests for UI
- [ ] BLoC test coverage with bloc_test package

### Performance
- [ ] Implement pagination for large lists
- [ ] Add image placeholders and shimmer effects
- [ ] Optimize rebuild cycles with BlocSelector
- [ ] Add performance monitoring
- [ ] Implement hydrated_bloc for state persistence

---

Last updated: 2025-11-19
State Management: **BLoC Pattern** (migrated from Riverpod)
