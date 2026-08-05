import '../widgets/cards/aster_status_card.dart';

typedef RiskStatus = AsterStatus;

class AttendanceRiskEvaluator {
  static AsterStatus evaluate({
    required double currentPercentage,
    required double requiredPercentage,
    required double safetyTargetPercentage,
  }) {
    if (currentPercentage >= safetyTargetPercentage) {
      return AsterStatus.safe;
    } else if (currentPercentage >= requiredPercentage) {
      return AsterStatus.watch;
    } else if (currentPercentage >= requiredPercentage - 5) {
      return AsterStatus.risky;
    } else if (currentPercentage >= requiredPercentage - 15) {
      return AsterStatus.critical;
    } else {
      return AsterStatus.unrecoverable;
    }
  }
}
