import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'daily_recommendation.dart';

class GeminiException implements Exception {
  const GeminiException(this.message);

  final String message;

  @override
  String toString() => 'GeminiException: $message';
}

class GeminiClient {
  GeminiClient({
    required this.apiKey,
    this.model = 'gemini-flash-latest',
    HttpClient? httpClient,
  }) : _httpClient = httpClient ?? HttpClient();

  final String apiKey;
  final String model;
  final HttpClient _httpClient;

  static const _systemPrompt = '''
You are Aster, a conservative academic attendance planning assistant.
Use only the supplied facts. Never invent events or attendance data.
Never recommend skipping an exam, mandatory practical, presentation, or compulsory event.
The minimum attendance threshold is a hard constraint and the safety target is preferred.
If data is missing, stale, or contradictory, choose NEEDS_REVIEW.
Numerical attendance values are calculated locally; do not alter them.
Return only JSON matching the supplied response schema.
''';

  static const responseSchema = <String, dynamic>{
    'type': 'OBJECT',
    'properties': {
      'decision': {
        'type': 'STRING',
        'enum': [
          'ATTEND_COLLEGE',
          'ATTEND_INTERNSHIP',
          'SPLIT_DAY',
          'NEEDS_REVIEW',
        ],
      },
      'confidence': {'type': 'NUMBER'},
      'risk_level': {
        'type': 'STRING',
        'enum': ['LOW', 'MEDIUM', 'HIGH', 'CRITICAL'],
      },
      'summary': {'type': 'STRING'},
      'reasons': {'type': 'ARRAY', 'items': {'type': 'STRING'}},
      'protected_events': {
        'type': 'ARRAY',
        'items': {
          'type': 'OBJECT',
          'properties': {
            'event_id': {'type': 'STRING'},
            'event_type': {'type': 'STRING'},
            'action': {'type': 'STRING'},
          },
          'required': ['event_id', 'event_type', 'action'],
        },
      },
      'suggested_actions': {'type': 'ARRAY', 'items': {'type': 'STRING'}},
      'data_warnings': {'type': 'ARRAY', 'items': {'type': 'STRING'}},
    },
    'required': [
      'decision',
      'confidence',
      'risk_level',
      'summary',
      'reasons',
      'protected_events',
      'suggested_actions',
      'data_warnings',
    ],
  };

  Future<DailyRecommendation> getDailyRecommendation(
    Map<String, dynamic> snapshot,
  ) async {
    if (apiKey.trim().isEmpty) {
      throw const GeminiException('Gemini API key is not configured');
    }

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent',
    );
    final request = await _httpClient.postUrl(uri).timeout(
      const Duration(seconds: 15),
    );
    request.headers.contentType = ContentType.json;
    request.headers.set('X-goog-api-key', apiKey);
    request.write(jsonEncode({
      'systemInstruction': {
        'parts': [
          {'text': _systemPrompt},
        ],
      },
      'contents': [
        {
          'role': 'user',
          'parts': [
            {'text': jsonEncode(snapshot)},
          ],
        },
      ],
      'generationConfig': {
        'responseMimeType': 'application/json',
        'responseSchema': responseSchema,
        'temperature': 0.1,
      },
    }));

    final response = await request.close().timeout(const Duration(seconds: 20));
    final body = await utf8.decoder.bind(response).join();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw GeminiException('Gemini request failed (${response.statusCode})');
    }

    try {
      final decoded = jsonDecode(body) as Map<String, dynamic>;
      final text = (((decoded['candidates'] as List).first as Map)
          ['content'] as Map)['parts'] as List;
      final jsonText = (text.first as Map)['text'] as String;
      return DailyRecommendation.fromJson(
        jsonDecode(jsonText) as Map<String, dynamic>,
      );
    } on Object catch (error) {
      throw GeminiException('Invalid structured response: $error');
    }
  }

  void close() => _httpClient.close(force: true);
}
