# All Units Flutter Practicals - Android Studio Project

Student: **Jadav Tushar A.** 
Roll No.: **15** 
University: **Atmiya University** 
Course: **B.C.A.**

## Verified program counts from the uploaded ZIP files

- Unit I: 30 Dart programs
- Unit II: 30 Dart programs
- Unit III: 30 Dart programs
- Unit IV: 30 Dart programs
- Unit V: 10 Dart programs (official Unit V practicals only)
- Total: 130 Dart programs

No extra Unit V programs are included.

## Open in Android Studio

This package contains the source project and `pubspec.yaml`. Because the Flutter SDK is not available in the environment where this ZIP was assembled, platform folders such as `android/` were not auto-generated here.

1. Extract this ZIP.
2. Open the extracted `All_Units_Flutter_Project` folder in Android Studio.
3. Open Android Studio's Terminal in the project folder.
4. Run:

```bash
flutter create .
flutter pub get
```

`flutter create .` generates the normal Android/iOS/web platform folders without removing the `lib` practical files.

## How to check each program

Each practical remains a separate `.dart` file with its own `main()`.

Folders:

- `lib/unit1/`
- `lib/unit2/`
- `lib/unit3/`
- `lib/unit4/`
- `lib/unit5/`

For a Flutter practical, you can run a specific target from the Terminal, for example:

```bash
flutter run -t lib/unit2/01_stateless_profile.dart
```

or open the `.dart` file in Android Studio and run its `main()` function.

Unit I includes basic Dart console programs. Those can be run as Dart programs from Android Studio where applicable, or with:

```bash
dart run lib/unit1/01_variables.dart
```

## Dependencies

All package imports used across the uploaded practical files are declared in the root `pubspec.yaml`, including Provider, Riverpod, BLoC, SharedPreferences, SQLite, Hive, path_provider, HTTP, connectivity, image picker, cache manager, and share_plus.

## Important

The practical files were preserved from the five ZIP files you supplied and organized into one project. They were not rewritten into one giant Dart file, because independent programs contain their own `main()` functions and often reuse class names such as `MyApp`; combining them directly would create conflicts.
