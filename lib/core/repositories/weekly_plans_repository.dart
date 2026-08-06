import '../database/aster_database.dart';
import '../database/daos/weekly_plans_dao.dart';

class WeeklyPlansRepository {
  final WeeklyPlansDao _weeklyPlansDao;

  WeeklyPlansRepository(this._weeklyPlansDao);

  Stream<WeeklyPlan?> watchSelectedPlan(DateTime weekStartDate) =>
      _weeklyPlansDao.watchSelectedPlan(weekStartDate);

  Stream<List<WeeklyPlanDay>> watchPlanDays(int planId) =>
      _weeklyPlansDao.watchPlanDays(planId);

  Future<int> addPlan(WeeklyPlansCompanion plan) =>
      _weeklyPlansDao.insertPlan(plan);

  Future selectPlan(int planId) => _weeklyPlansDao.selectPlan(planId);
}
