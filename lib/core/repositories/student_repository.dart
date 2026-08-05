import '../database/aster_database.dart';

import '../database/daos/student_profile_dao.dart';

class StudentRepository {
  final StudentProfileDao _studentProfileDao;

  StudentRepository(this._studentProfileDao);

  Stream<StudentProfile?> watchProfile() => _studentProfileDao.watchProfile();

  Future<int> saveProfile(StudentProfilesCompanion profile) =>
      _studentProfileDao.upsertProfile(profile);
}
