import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gemini_client.dart';

/// Development-only configuration. In production, replace this client with
/// an authenticated backend proxy so the Gemini key is never shipped in APK.
final geminiClientProvider = Provider<GeminiClient>((ref) {
  final client = GeminiClient(
    apiKey: const String.fromEnvironment('GEMINI_API_KEY'),
  );
  ref.onDispose(client.close);
  return client;
});
