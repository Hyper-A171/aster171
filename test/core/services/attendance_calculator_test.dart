import 'package:flutter_test/flutter_test.dart';
import 'package:aster/core/services/attendance_calculator.dart';
import 'package:aster/core/services/attendance_risk_evaluator.dart';
import 'package:aster/core/services/recovery_calculator.dart';

void main() {
  group('AttendanceCalculator Tests', () {
    test('Zero total counted units returns 0.0 percentage', () {
      final pct = AttendanceCalculator.calculatePercentage(0, 0);
      expect(pct, equals(0.0));
    });

    test('Exact 75% attendance calculation', () {
      final pct = AttendanceCalculator.calculatePercentage(15, 20);
      expect(pct, equals(75.0));
    });

    test('Above safety target (80%+)', () {
      final pct = AttendanceCalculator.calculatePercentage(17, 20);
      expect(pct, equals(85.0));
    });

    test('Safe absences count calculation', () {
      // 18 attended out of 20 = 90%. Required = 75%.
      // (18 * 100) / 75 = 24 total max. 24 - 20 = 4 safe absences.
      final safe = AttendanceCalculator.calculateSafeAbsences(18, 20, 75.0);
      expect(safe, equals(4));
    });

    test('Recovery lectures required calculation', () {
      // 12 attended out of 20 = 60%. Required = 75%.
      // (75 * 20 - 100 * 12) / (100 - 75) = (1500 - 1200) / 25 = 300 / 25 = 12.
      final recovery = RecoveryCalculator.calculateRequiredRecovery(
        attendedUnits: 12,
        totalCountedUnits: 20,
        requiredPercentage: 75.0,
      );
      expect(recovery, equals(12));
    });
  });

  group('AttendanceRiskEvaluator Tests', () {
    test('Safe status when >= safety target', () {
      final status = AttendanceRiskEvaluator.evaluate(
        currentPercentage: 82.0,
        requiredPercentage: 75.0,
        safetyTargetPercentage: 80.0,
      );
      expect(status, equals(RiskStatus.safe));
    });

    test('Watch status when >= required but < safety target', () {
      final status = AttendanceRiskEvaluator.evaluate(
        currentPercentage: 77.0,
        requiredPercentage: 75.0,
        safetyTargetPercentage: 80.0,
      );
      expect(status, equals(RiskStatus.watch));
    });

    test('Risky status when slightly below required', () {
      final status = AttendanceRiskEvaluator.evaluate(
        currentPercentage: 72.0,
        requiredPercentage: 75.0,
        safetyTargetPercentage: 80.0,
      );
      expect(status, equals(RiskStatus.risky));
    });

    test('Critical status when severely below required', () {
      final status = AttendanceRiskEvaluator.evaluate(
        currentPercentage: 62.0,
        requiredPercentage: 75.0,
        safetyTargetPercentage: 80.0,
      );
      expect(status, equals(RiskStatus.critical));
    });

    test('Unrecoverable status when dangerously low', () {
      final status = AttendanceRiskEvaluator.evaluate(
        currentPercentage: 50.0,
        requiredPercentage: 75.0,
        safetyTargetPercentage: 80.0,
      );
      expect(status, equals(RiskStatus.unrecoverable));
    });
  });
}
