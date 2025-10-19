# HNG Mobile Stage Zero - Portfolio App

A professional personal portfolio mobile app built with Flutter featuring light/dark theme support, home, about, and contact sections.

## Features

- ✅ Bottom tab navigation (Home, About, Contact)
- ✅ Light & Dark theme toggle
- ✅ Contact form with validation
- ✅ Skills showcase by category
- ✅ Social media links
- ✅ Responsive mobile design

## Prerequisites

- Flutter SDK 3.0.0+
- Dart SDK (included with Flutter)
- Android SDK or iOS SDK
- Code editor (VS Code or Android Studio)

## Installation

1. **Install Flutter**
```bash
# macOS
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:$HOME/flutter/bin"

# Windows: Download from https://flutter.dev/docs/get-started/install/windows
# Linux: Same as macOS
```

2. **Verify Installation**
```bash
flutter doctor
```

3. **Clone Project**
```bash
git clone https://github.com/codedbyfemi/hng-mobile-stage-zero.git
cd hng-mobile-stage-zero
```

4. **Get Dependencies**
```bash
flutter pub get
```

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/                      # Data models
├── screens/                     # Home, About, Contact screens
├── widgets/                     # Reusable widgets
└── utils/                       # Theme configuration
```

## Running the App

```bash
# Debug mode
flutter run

# Release mode
flutter run --release

# On specific device
flutter run -d <device-id>

# List devices
flutter devices
```

## Development

```bash
# Hot reload (preserves state)
Press 'r' in terminal

# Hot restart (clears state)
Press 'R' in terminal

# Format code
flutter format lib/

# Analyze code
flutter analyze
```

## Building for Release

```bash
# Android APK
flutter build apk

# Android App Bundle (Play Store)
flutter build appbundle

# iOS
flutter build ios --release

# Web
flutter build web
```

## Dependencies

- `flutter` - Framework
- `provider` - State management
- `google_fonts` - Typography
- `url_launcher` - Open URLs/emails
- `cupertino_icons` - Icons

## Customization

**Change Profile Info** → Edit `lib/screens/home_screen.dart`

**Update Skills** → Edit `lib/screens/about_screen.dart`

**Update Contact Details** → Edit `lib/screens/contact_screen.dart`

**Change Theme Colors** → Edit `lib/utils/theme.dart`

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Build fails | `flutter clean && flutter pub get` |
| Pod error | `cd ios && pod repo update && cd ..` |
| Hot reload fails | Press `R` for hot restart |
| Doctor errors | Follow `flutter doctor` instructions |

## Common Commands

```bash
flutter create project_name        # New project
flutter devices                    # List devices
flutter run -v                     # Run with verbose output
flutter pub upgrade               # Update packages
flutter test                      # Run tests
```

## Device Support

- Android 5.0+ (API 21+)
- iOS 11.0+

## Resources

- [Flutter Docs](https://flutter.dev/docs)
- [Dart Docs](https://dart.dev/guides)
- [Material Design](https://material.io/design)

---

Made with ❤️ | Version 1.0.0