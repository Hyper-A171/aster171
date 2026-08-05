import 'attendance_calculator.dart';

class SemesterProjectionService {
  /// Calculate maximum possible final attendance if the student attends all remaining lectures.
  static double calculateMaxPossibleAttendance({
    required double attendedUnits,
    required double totalCountedUnits,
    required double remainingPlannedUnits,
  }) {
    final totalUnits = totalCountedUnits + remainingPlannedUnits;
    if (totalUnits <= 0) return 100.0;
    return AttendanceCalculator.calculatePercentage(
      attendedUnits + remainingPlannedUnits,
      totalUnits,
    );
  }

  /// Calculate projected semester-end attendance assuming current attendance trend continues.
  static double calculateProjectedAttendance({
    required double attendedUnits,
    required double totalCountedUnits,
    required double remainingPlannedUnits,
  }) {
    if (totalCountedUnits <= 0) return 100.0;
    final currentRate = attendedUnits / totalCountedUnits;
    final projectedAttended =
        attendedUnits + (remainingPlannedUnits * currentRate);
    final totalUnits = totalCountedUnits + remainingPlannedUnits;
    return AttendanceCalculator.calculatePercentage(
      projectedAttended,
      totalUnits,
    );
  }
}
