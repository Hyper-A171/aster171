enum DailyDecision {
  attendCollege,
  attendInternship,
  splitDay,
  needsReview,
}

enum RecommendationRisk { low, medium, high, critical }

class ProtectedEvent {
  const ProtectedEvent({
    required this.eventId,
    required this.eventType,
    required this.action,
  });

  final String eventId;
  final String eventType;
  final String action;

  factory ProtectedEvent.fromJson(Map<String, dynamic> json) {
    return ProtectedEvent(
      eventId: _requiredString(json, 'event_id'),
      eventType: _requiredString(json, 'event_type'),
      action: _requiredString(json, 'action'),
    );
  }
}

class DailyRecommendation {
  const DailyRecommendation({
    required this.decision,
    required this.confidence,
    required this.riskLevel,
    required this.summary,
    required this.reasons,
    required this.protectedEvents,
    required this.suggestedActions,
    required this.dataWarnings,
  });

  final DailyDecision decision;
  final double confidence;
  final RecommendationRisk riskLevel;
  final String summary;
  final List<String> reasons;
  final List<ProtectedEvent> protectedEvents;
  final List<String> suggestedActions;
  final List<String> dataWarnings;

  factory DailyRecommendation.fromJson(Map<String, dynamic> json) {
    final confidence = (json['confidence'] as num?)?.toDouble();
    if (confidence == null || confidence < 0 || confidence > 1) {
      throw const FormatException('Recommendation confidence must be 0..1');
    }

    final decision = _parseDecision(_requiredString(json, 'decision'));
    final riskLevel = _parseRisk(_requiredString(json, 'risk_level'));
    final protectedEvents = _requiredList(json, 'protected_events')
        .map((item) => ProtectedEvent.fromJson(item))
        .toList(growable: false);

    return DailyRecommendation(
      decision: decision,
      confidence: confidence,
      riskLevel: riskLevel,
      summary: _requiredString(json, 'summary'),
      reasons: _stringList(json, 'reasons'),
      protectedEvents: protectedEvents,
      suggestedActions: _stringList(json, 'suggested_actions'),
      dataWarnings: _stringList(json, 'data_warnings'),
    );
  }

  static String _requiredString(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! String || value.trim().isEmpty) {
      throw FormatException('Missing or invalid $key');
    }
    return value;
  }

  static List<Map<String, dynamic>> _requiredList(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];
    if (value is! List) throw FormatException('Missing or invalid $key');
    return value.whereType<Map<String, dynamic>>().toList(growable: false);
  }

  static List<String> _stringList(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! List || value.any((item) => item is! String)) {
      throw FormatException('Missing or invalid $key');
    }
    return value.cast<String>().toList(growable: false);
  }

  static DailyDecision _parseDecision(String value) => switch (value) {
    'ATTEND_COLLEGE' => DailyDecision.attendCollege,
    'ATTEND_INTERNSHIP' => DailyDecision.attendInternship,
    'SPLIT_DAY' => DailyDecision.splitDay,
    'NEEDS_REVIEW' => DailyDecision.needsReview,
    _ => throw FormatException('Unknown decision: $value'),
  };

  static RecommendationRisk _parseRisk(String value) => switch (value) {
    'LOW' => RecommendationRisk.low,
    'MEDIUM' => RecommendationRisk.medium,
    'HIGH' => RecommendationRisk.high,
    'CRITICAL' => RecommendationRisk.critical,
    _ => throw FormatException('Unknown risk level: $value'),
  };
}
