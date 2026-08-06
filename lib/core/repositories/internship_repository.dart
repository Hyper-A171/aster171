import '../database/aster_database.dart';
import '../database/daos/internship_dao.dart';

class InternshipRepository {
  final InternshipDao _internshipDao;

  InternshipRepository(this._internshipDao);

  Stream<InternshipRequirement?> watchRequirements(int studentProfileId) =>
      _internshipDao.watchRequirements(studentProfileId);

  Stream<List<InternshipAvailabilityData>> watchAvailability(int requirementId) =>
      _internshipDao.watchAvailability(requirementId);

  Stream<List<InternshipSession>> watchCurrentWeekSessions() =>
      _internshipDao.watchCurrentWeekSessions();

  Future<int> saveRequirements(InternshipRequirementsCompanion requirements) =>
      _internshipDao.upsertRequirements(requirements);
}
