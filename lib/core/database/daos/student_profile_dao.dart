import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'student_profile_dao.g.dart';

@DriftAccessor(tables: [StudentProfiles])
class StudentProfileDao extends DatabaseAccessor<AsterDatabase>
    with _$StudentProfileDaoMixin {
  StudentProfileDao(super.db);

  Stream<StudentProfile?> watchProfile() {
    return (select(studentProfiles)..limit(1)).watchSingleOrNull();
  }

  Future<StudentProfile?> getProfile() {
    return (select(studentProfiles)..limit(1)).getSingleOrNull();
  }

  Future<int> upsertProfile(StudentProfilesCompanion profile) {
    return into(studentProfiles).insertOnConflictUpdate(profile);
  }
}
