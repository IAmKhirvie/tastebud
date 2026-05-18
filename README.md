# TasteBud

**Music Taste Made for Your Earbuds**

TasteBud is an offline-first mobile audio player and music taste organizer built with Flutter. It plays audio files already stored on the user's device and adds playlists, favorites, mood-based organization, taste profiling, automatic thumbnails, and synchronized lyrics.

TasteBud does **not** download, stream, convert, host, or distribute music.

---

## Project Status

Currently in the **Requirements / Setup Phase** of the Agile SDLC. The Flutter project has been scaffolded, dependencies installed, platform manifests configured, and the 11 core modules created as empty folders.

---

## Tech Stack

- **Framework:** Flutter (stable, 3.41.9+)
- **Audio:** `just_audio`, `audio_service`, `audio_session`
- **State:** `flutter_riverpod`
- **Local DB:** `hive` + `hive_flutter`
- **File access:** `on_audio_query`, `file_picker`, `permission_handler`
- **Online lookup:** `http`, `cached_network_image` (MusicBrainz / Cover Art Archive / LRCLIB)
- **Lyrics:** `flutter_lyric`
- **UI:** `flutter_card_swiper`, `flip_card`, `flutter_slidable`, `flutter_animate`, `google_fonts`, `dynamic_color`

Full list in [`pubspec.yaml`](./pubspec.yaml).

---

## Project Structure

```
lib/
├── main.dart
├── core/
│   ├── theme/          # 3-color theme system + mood palette
│   ├── router/
│   ├── constants/
│   └── utils/
└── modules/
    ├── library/        # Music Library Module
    ├── player/         # Music Player Module
    ├── playlist/       # Playlist Module
    ├── favorites/      # Favorites Module
    ├── recently_played/# Recently Played Module
    ├── search/         # Search and Filter Module
    ├── taste_profile/  # Taste Profile Module
    ├── mood/           # Mood Recommendation Module
    ├── thumbnail/      # Thumbnail Management Module
    ├── lyrics/         # Lyrics Management Module
    └── settings/       # Settings Module
```

Each module follows a `data / domain / presentation` split.

---

## What Was Done (Completed Setup Steps)

- [x] Installed Flutter SDK, Git, CocoaPods via Homebrew
- [x] Verified with `flutter doctor`
- [x] Created Flutter project with `com.tastebud` organization
- [x] Added all required dependencies to `pubspec.yaml`
- [x] Configured `AndroidManifest.xml` (media permissions, foreground service for background playback)
- [x] Configured iOS `Info.plist` (media library, background audio, photo library)
- [x] Scaffolded 11 module folders under `lib/modules/`
- [x] Added 3-color theme system (Default Premium, Night Deck, Soft Vinyl) and default mood palette
- [x] First commit pushed to GitHub

---

## What To Do Next

### 1. Install the remaining toolchain (one-time, on your machine)

These need GUI installers and can't be done from the terminal:

- **Android Studio** — https://developer.android.com/studio
  On first launch it installs the Android SDK. After install, open **SDK Manager** and confirm:
  - Android SDK Platform 34
  - Android SDK Build-Tools 34
  - Android SDK Platform-Tools
  - Android Emulator

  Then open **Device Manager** and create a Pixel 7 (API 34) virtual device.

- **Xcode** *(macOS only, if you want iOS builds)* — install from the Mac App Store, then:
  ```bash
  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch
  ```

- **VS Code** + **Flutter extension** (recommended IDE):
  ```bash
  brew install --cask visual-studio-code
  ```
  Then in VS Code → Extensions → install "Flutter" (pulls Dart automatically).

After installing Android Studio, verify everything:
```bash
flutter doctor -v
```
You want green checks on Flutter, Android toolchain, and Chrome at minimum.

### 2. Run the app for the first time

```bash
git clone https://github.com/IAmKhirvie/tastebud.git
cd tastebud
flutter pub get
flutter run
```

Pick a device when prompted (emulator, Chrome, or a connected phone).

### 3. Enter the Design Phase (next Agile phase)

Before writing feature code, the team should produce:

- [ ] **Architecture diagram** — how modules talk to each other (data flow: device files → on_audio_query → Hive → Riverpod → UI)
- [ ] **Hive schemas** — data classes for `Song`, `Playlist`, `Mood`, `TasteProfile`, `PlaybackHistoryEntry`
- [ ] **Taste Deck wireframe** — card front/back layout, gestures, hold-menu
- [ ] **Home / Library wireframe** — layered layout (Now Playing → Taste Deck shortcut → Recently Played → Favorites → Playlists → Moods)
- [ ] **Recommendation rules** — concrete rules for the mood + taste profile recommender (e.g. "If current mood = Chill, surface songs tagged Chill that were played < 3× this week")
- [ ] **Taste profile quiz design** — questions + how answers map to mood / genre weights
- [ ] **Online lookup flow** — MusicBrainz / Cover Art Archive / LRCLIB request shape + user confirmation step before caching

### 4. Then the Implementation Phase (per-sprint)

Suggested sprint order (each sprint = one or two modules):

1. **Sprint 1 — Library + Player** (the MVP loop). Scan device, list songs, play one. Background playback. Lock screen controls.
2. **Sprint 2 — Playlists + Favorites + Recently Played.**
3. **Sprint 3 — Search + Mood tagging.**
4. **Sprint 4 — Taste Deck UI (card swipe + flip).**
5. **Sprint 5 — Thumbnail Management** (embedded art first, then optional online lookup).
6. **Sprint 6 — Lyrics Management** (.lrc import first, then optional online lookup).
7. **Sprint 7 — Taste Profile quiz + rule-based recommender.**
8. **Sprint 8 — Settings, theme picker, mood color editor, customizable swipe actions, polish.**

### 5. Branching strategy

- `main` — always working, releasable.
- `develop` — integration branch.
- `feature/<module>-<short-desc>` — one branch per user story.
- Open a PR into `develop`; merge into `main` at the end of each sprint.

---

## Copyright

TasteBud does not provide, host, sell, distribute, convert, or claim ownership of any music files played in the app. Users are responsible for ensuring the audio files on their device are legally obtained. Thumbnails and lyrics retrieved online are stored locally only and removed on uninstall.

---

## License

TBD — add a license file before the first public release (MIT is a safe default for a capstone).
