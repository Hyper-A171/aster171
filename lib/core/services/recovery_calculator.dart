import 'attendance_calculator.dart';

class RecoveryCalculator {
  static int calculateRequiredRecovery({
    required double attendedUnits,
    required double totalCountedUnits,
    required double requiredPercentage,
  }) {
    return AttendanceCalculator.calculateRecoveryLectures(
      attendedUnits,
      totalCountedUnits,
      requiredPercentage,
    );
  }
}
