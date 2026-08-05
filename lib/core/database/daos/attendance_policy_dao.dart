import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'attendance_policy_dao.g.dart';

@DriftAccessor(tables: [AttendancePolicies])
class AttendancePolicyDao extends DatabaseAccessor<AsterDatabase>
    with _$AttendancePolicyDaoMixin {
  AttendancePolicyDao(super.db);

  Stream<AttendancePolicy?> watchPolicy(int studentProfileId) {
    return (select(attendancePolicies)
          ..where((t) => t.studentProfileId.equals(studentProfileId))
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<int> upsertPolicy(AttendancePoliciesCompanion policy) {
    return into(attendancePolicies).insertOnConflictUpdate(policy);
  }
}
