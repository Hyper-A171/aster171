import 'package:flutter/foundation.dart';
import '../services/attendance_calculator.dart';
import '../services/attendance_risk_evaluator.dart';
import '../services/recovery_calculator.dart';

@immutable
class AttendanceSummary {
  final double attendedUnits;
  final double totalCountedUnits;
  final double currentPercentage;
  final int safeAbsences;
  final int recoveryNeeded;
  final RiskStatus riskStatus;

  // Raw counts
  final int presentCount;
  final int absentCount;
  final int cancelledCount;
  final int pendingCount;
  final int excusedCount;

  const AttendanceSummary({
    required this.attendedUnits,
    required this.totalCountedUnits,
    required this.currentPercentage,
    required this.safeAbsences,
    required this.recoveryNeeded,
    required this.riskStatus,
    this.presentCount = 0,
    this.absentCount = 0,
    this.cancelledCount = 0,
    this.pendingCount = 0,
    this.excusedCount = 0,
  });

  const AttendanceSummary.initial()
    : attendedUnits = 0,
      totalCountedUnits = 0,
      currentPercentage = 0,
      safeAbsences = 0,
      recoveryNeeded = 0,
      riskStatus = RiskStatus.safe,
      presentCount = 0,
      absentCount = 0,
      cancelledCount = 0,
      pendingCount = 0,
      excusedCount = 0;

  factory AttendanceSummary.calculate({
    required double attendedUnits,
    required double totalCountedUnits,
    required double requiredPercentage,
    double safetyTargetPercentage = 80.0,
    int presentCount = 0,
    int absentCount = 0,
    int cancelledCount = 0,
    int pendingCount = 0,
    int excusedCount = 0,
  }) {
    final currentPercentage = AttendanceCalculator.calculatePercentage(
      attendedUnits,
      totalCountedUnits,
    );

    final riskStatus = AttendanceRiskEvaluator.evaluate(
      currentPercentage: currentPercentage,
      requiredPercentage: requiredPercentage,
      safetyTargetPercentage: safetyTargetPercentage,
    );

    final safeAbsences = AttendanceCalculator.calculateSafeAbsences(
      attendedUnits,
      totalCountedUnits,
      requiredPercentage,
    );

    final recoveryNeeded = RecoveryCalculator.calculateRequiredRecovery(
      attendedUnits: attendedUnits,
      totalCountedUnits: totalCountedUnits,
      requiredPercentage: requiredPercentage,
    );

    return AttendanceSummary(
      attendedUnits: attendedUnits,
      totalCountedUnits: totalCountedUnits,
      currentPercentage: currentPercentage,
      safeAbsences: safeAbsences,
      recoveryNeeded: recoveryNeeded,
      riskStatus: riskStatus,
      presentCount: presentCount,
      absentCount: absentCount,
      cancelledCount: cancelledCount,
      pendingCount: pendingCount,
      excusedCount: excusedCount,
    );
  }

  bool get hasData => totalCountedUnits > 0;
}
