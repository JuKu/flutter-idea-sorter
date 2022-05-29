# flutter-idea-sorter

A simple idea sorter and manager app for android and iOS#

Issues: [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/2571898)

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

# If you prefer keeping your files up to date,
# enter the following command to watch for file changes and
# run the code generation tool every time a file change is detected:
flutter packages pub run build_runner watch
```