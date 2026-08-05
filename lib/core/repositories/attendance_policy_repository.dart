import '../database/aster_database.dart';
import '../database/daos/attendance_policy_dao.dart';

class AttendancePolicyRepository {
  final AttendancePolicyDao _attendancePolicyDao;

  AttendancePolicyRepository(this._attendancePolicyDao);

  Stream<AttendancePolicy?> watchPolicy(int studentProfileId) =>
      _attendancePolicyDao.watchPolicy(studentProfileId);

  Future<int> savePolicy(AttendancePoliciesCompanion policy) =>
      _attendancePolicyDao.upsertPolicy(policy);
}
