# Aster

Intelligent attendance and internship planning application.

## Getting started

Install Flutter with Dart 3.12.2 or later, then fetch the dependencies:

```sh
flutter pub get
```

### Gemini configuration

Pass the Gemini API key at build time. Do not add the key to source control:

```sh
flutter run --dart-define=GEMINI_API_KEY=YOUR_API_KEY
```

For a production release, call Gemini through an authenticated backend instead.
Values supplied with `--dart-define` are compiled into the client application and
must not be treated as secret.

### Code generation

Regenerate Drift and Riverpod sources after changing annotated database code:

```sh
dart run build_runner build --delete-conflicting-outputs
```

### Verification

```sh
flutter analyze
flutter test
```
