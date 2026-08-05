class AttendanceCalculator {
  static double calculatePercentage(
    double attendedUnits,
    double totalCountedUnits,
  ) {
    if (totalCountedUnits <= 0) return 0.0;
    return (attendedUnits / totalCountedUnits) * 100;
  }

  static int calculateSafeAbsences(
    double attendedUnits,
    double totalCountedUnits,
    double requiredPercentage,
  ) {
    if (totalCountedUnits <= 0) return 0;
    // (attendedUnits) / (totalCountedUnits + x) >= requiredPercentage / 100
    // attendedUnits >= (totalCountedUnits + x) * (requiredPercentage / 100)
    // attendedUnits / (requiredPercentage / 100) >= totalCountedUnits + x
    // x <= (attendedUnits * 100 / requiredPercentage) - totalCountedUnits

    final maxTotal = (attendedUnits * 100) / requiredPercentage;
    final safeAbsences = (maxTotal - totalCountedUnits).floor();
    return safeAbsences > 0 ? safeAbsences : 0;
  }

  static int calculateRecoveryLectures(
    double attendedUnits,
    double totalCountedUnits,
    double requiredPercentage,
  ) {
    if (totalCountedUnits <= 0) return 0;
    final current = calculatePercentage(attendedUnits, totalCountedUnits);
    if (current >= requiredPercentage) return 0;

    // (attendedUnits + x) / (totalCountedUnits + x) >= requiredPercentage / 100
    // (attendedUnits + x) * 100 >= requiredPercentage * (totalCountedUnits + x)
    // 100 * attendedUnits + 100x >= requiredPercentage * totalCountedUnits + requiredPercentage * x
    // (100 - requiredPercentage) * x >= requiredPercentage * totalCountedUnits - 100 * attendedUnits
    // x >= (requiredPercentage * totalCountedUnits - 100 * attendedUnits) / (100 - requiredPercentage)

    final x =
        (requiredPercentage * totalCountedUnits - 100 * attendedUnits) /
        (100 - requiredPercentage);
    return x.ceil();
  }
}
