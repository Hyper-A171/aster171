import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'daily_recommendation.dart';
import '../models/timetable_import.dart';

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
      'reasons': {
        'type': 'ARRAY',
        'items': {'type': 'STRING'},
      },
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
      'suggested_actions': {
        'type': 'ARRAY',
        'items': {'type': 'STRING'},
      },
      'data_warnings': {
        'type': 'ARRAY',
        'items': {'type': 'STRING'},
      },
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

  static const timetableResponseSchema = <String, dynamic>{
    'type': 'OBJECT',
    'properties': {
      'entries': {
        'type': 'ARRAY',
        'items': {
          'type': 'OBJECT',
          'properties': {
            'subject_name': {'type': 'STRING'},
            'course_code': {'type': 'STRING'},
            'teacher_name': {'type': 'STRING'},
            'weekday': {'type': 'INTEGER', 'minimum': 1, 'maximum': 7},
            'start_minutes': {'type': 'INTEGER', 'minimum': 0, 'maximum': 1439},
            'end_minutes': {'type': 'INTEGER', 'minimum': 1, 'maximum': 1440},
          },
          'required': [
            'subject_name',
            'course_code',
            'weekday',
            'start_minutes',
            'end_minutes',
          ],
        },
      },
    },
    'required': ['entries'],
  };

  Future<List<TimetableImportEntry>> analyzeTimetable(
    Uint8List bytes,
    String mimeType,
  ) async {
    if (apiKey.trim().isEmpty) {
      throw const GeminiException('Gemini API key is not configured');
    }
    if (bytes.isEmpty) {
      throw const GeminiException('The selected timetable file is empty');
    }

    final firstPass = await _extractTimetable(bytes, mimeType, '''
Extract the weekly college timetable from this document.
Read timetable grids carefully, including rotated text and merged laboratory cells.
Use period/bell-time headers to calculate start and end times. Expand subject abbreviations using any legend in the document.
Use the teacher/faculty legend to return teacher_name for every matching subject. Use an empty string when unavailable.
Return only actual lecture, laboratory, tutorial, project, or seminar periods.
Ignore headings, lunch, recess, notes, and examination schedules.
Use weekday 1 for Monday through 7 for Sunday.
Convert printed local times to minutes after midnight. If a course code is not visible, use an empty string.
If the document contains multiple classes, prefer Semester 5 Computer Engineering/Computer Science. Do not mix divisions.
''');
    if (firstPass.isNotEmpty) return firstPass;

    final secondPass = await _extractTimetable(bytes, mimeType, '''
Re-check this document as a visual timetable grid. The first extraction found no rows.
Locate weekday labels (Mon-Sat), period-number columns, bell timings, and subject abbreviations even when text is small.
Read any teacher/faculty legend and attach the corresponding teacher_name to each period.
If start/end times are in a separate header or bell schedule, join them to each subject cell.
For a lab spanning multiple periods, return one entry from the first start time to the final end time.
Extract Semester 5 Computer Engineering/Computer Science when several timetables are shown.
Never return lunch/recess as a subject. Return every visible teaching period that has a determinable day and time.
''');
    if (secondPass.isEmpty) {
      throw const GeminiException(
        'No lecture periods could be detected. Use a clear timetable grid that includes weekdays and start/end times.',
      );
    }
    return secondPass;
  }

  Future<List<TimetableImportEntry>> _extractTimetable(
    Uint8List bytes,
    String mimeType,
    String prompt,
  ) async {
    Object? lastNetworkError;
    for (var attempt = 1; attempt <= 3; attempt++) {
      try {
        return await _extractTimetableOnce(bytes, mimeType, prompt);
      } on SocketException catch (error) {
        lastNetworkError = error;
      } on HttpException catch (error) {
        lastNetworkError = error;
      } on TimeoutException catch (error) {
        lastNetworkError = error;
      }
      if (attempt < 3) {
        await Future<void>.delayed(Duration(seconds: attempt * 2));
      }
    }
    throw GeminiException(
      'Could not connect to Gemini after 3 attempts. Check mobile data/Wi-Fi, disable VPN or Private DNS temporarily, and try again. (${lastNetworkError.runtimeType})',
    );
  }

  Future<List<TimetableImportEntry>> _extractTimetableOnce(
    Uint8List bytes,
    String mimeType,
    String prompt,
  ) async {
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent',
    );
    final request = await _httpClient
        .postUrl(uri)
        .timeout(const Duration(seconds: 20));
    request.headers.contentType = ContentType.json;
    request.headers.set('X-goog-api-key', apiKey);
    request.write(
      jsonEncode({
        'contents': [
          {
            'role': 'user',
            'parts': [
              {'text': prompt},
              {
                'inlineData': {
                  'mimeType': mimeType,
                  'data': base64Encode(bytes),
                },
              },
            ],
          },
        ],
        'generationConfig': {
          'responseMimeType': 'application/json',
          'responseSchema': timetableResponseSchema,
          'temperature': 0.0,
        },
      }),
    );

    final response = await request.close().timeout(const Duration(seconds: 60));
    final body = await utf8.decoder.bind(response).join();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw GeminiException(
        'Timetable analysis failed (${response.statusCode})',
      );
    }

    try {
      final decoded = jsonDecode(body) as Map<String, dynamic>;
      final candidates = decoded['candidates'] as List;
      final content = (candidates.first as Map)['content'] as Map;
      final parts = content['parts'] as List;
      final jsonText = (parts.first as Map)['text'] as String;
      final result = jsonDecode(jsonText) as Map<String, dynamic>;
      final entries =
          (result['entries'] as List)
              .map(
                (entry) => TimetableImportEntry.fromJson(
                  Map<String, dynamic>.from(entry as Map),
                ),
              )
              .where(
                (entry) =>
                    entry.subjectName.isNotEmpty &&
                    entry.weekday >= 1 &&
                    entry.weekday <= 7 &&
                    entry.endMinutes > entry.startMinutes,
              )
              .toList()
            ..sort((a, b) {
              final day = a.weekday.compareTo(b.weekday);
              return day != 0 ? day : a.startMinutes.compareTo(b.startMinutes);
            });
      return entries;
    } on GeminiException {
      rethrow;
    } on Object catch (error) {
      throw GeminiException('Invalid timetable analysis: $error');
    }
  }

  Future<DailyRecommendation> getDailyRecommendation(
    Map<String, dynamic> snapshot,
  ) async {
    if (apiKey.trim().isEmpty) {
      throw const GeminiException('Gemini API key is not configured');
    }

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent',
    );
    final request = await _httpClient
        .postUrl(uri)
        .timeout(const Duration(seconds: 15));
    request.headers.contentType = ContentType.json;
    request.headers.set('X-goog-api-key', apiKey);
    request.write(
      jsonEncode({
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
      }),
    );

    final response = await request.close().timeout(const Duration(seconds: 20));
    final body = await utf8.decoder.bind(response).join();
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw GeminiException('Gemini request failed (${response.statusCode})');
    }

    try {
      final decoded = jsonDecode(body) as Map<String, dynamic>;
      final text =
          (((decoded['candidates'] as List).first as Map)['content']
                  as Map)['parts']
              as List;
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
