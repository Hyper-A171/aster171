import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'weekly_plans_dao.g.dart';

@DriftAccessor(tables: [WeeklyPlans, WeeklyPlanDays])
class WeeklyPlansDao extends DatabaseAccessor<AsterDatabase>
    with _$WeeklyPlansDaoMixin {
  WeeklyPlansDao(super.db);

  Stream<WeeklyPlan?> watchSelectedPlan(DateTime weekStartDate) {
    return (select(weeklyPlans)..where(
          (t) =>
              t.weekStartDate.equals(weekStartDate) & t.isSelected.equals(true),
        ))
        .watchSingleOrNull();
  }

  Stream<List<WeeklyPlanDay>> watchPlanDays(int planId) {
    return (select(
      weeklyPlanDays,
    )..where((t) => t.weeklyPlanId.equals(planId))).watch();
  }

  Future<int> insertPlan(WeeklyPlansCompanion plan) =>
      into(weeklyPlans).insert(plan);

  Future selectPlan(int planId) async {
    return transaction(() async {
      final plan = await (select(
        weeklyPlans,
      )..where((t) => t.id.equals(planId))).getSingle();
      await (update(weeklyPlans)
            ..where((t) => t.weekStartDate.equals(plan.weekStartDate)))
          .write(const WeeklyPlansCompanion(isSelected: Value(false)));
      await (update(weeklyPlans)..where((t) => t.id.equals(planId))).write(
        const WeeklyPlansCompanion(isSelected: Value(true)),
      );
    });
  }
}
