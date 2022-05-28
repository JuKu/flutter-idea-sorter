# flutter-idea-sorter

A simple idea sorter and manager app for android and iOS

# Generate android and iOS icons
```shell
flutter pub get
flutter pub run flutter_launcher_icons:main
```

# App Signing

See also: https://docs.flutter.dev/deployment/android

# Mocks generieren (vor Tests)

Generiert `@GenerateMocks`

```shell
flutter packages run build_runner build --delete-conflicting-outputs
```

# Floor Database Commands

```shell
flutter packages pub run build_runner build
flutter packages pub run build_runner watch
```