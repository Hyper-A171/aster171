import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_providers.dart';
import 'daily_recommendation.dart';
import 'gemini_client.dart';

/// Gemini client configured at build time with `--dart-define`.
final geminiClientProvider = Provider<GeminiClient>((ref) {
  const apiKey = String.fromEnvironment('GEMINI_API_KEY');
  final client = GeminiClient(apiKey: apiKey.trim());
  ref.onDispose(client.close);
  return client;
});

/// Reactive AI Provider that sends real-time student & subject snapshots to Gemini 1.5 Flash.
final dailyAiRecommendationProvider = FutureProvider<DailyRecommendation?>((
  ref,
) async {
  final client = ref.watch(geminiClientProvider);
  final profileAsync = ref.watch(currentStudentProfileProvider);
  final subjectsAsync = ref.watch(activeSubjectsProvider);

  final profile = profileAsync.value;
  final subjects = subjectsAsync.value ?? [];

  if (profile == null && subjects.isEmpty) {
    return null;
  }

  final snapshot = <String, dynamic>{
    'student': {
      'name': profile?.name ?? 'Student',
      'course': profile?.course ?? 'Degree Program',
      'semester': profile?.semesterName ?? 'Semester 1',
    },
    'timestamp': DateTime.now().toIso8601String(),
    'policy': {
      'minimum_required_percentage': 75.0,
      'safety_target_percentage': 76.0,
    },
    'active_subjects': subjects.map((s) {
      return {
        'id': s.id.toString(),
        'name': s.name,
        'code': s.code ?? '',
        'type': s.subjectType,
        'is_mandatory': s.isMandatory,
      };
    }).toList(),
  };

  try {
    return await client.getDailyRecommendation(snapshot);
  } catch (error) {
    return null;
  }
});
