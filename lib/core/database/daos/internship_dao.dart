import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'internship_dao.g.dart';

@DriftAccessor(
  tables: [InternshipRequirements, InternshipAvailability, InternshipSessions],
)
class InternshipDao extends DatabaseAccessor<AsterDatabase>
    with _$InternshipDaoMixin {
  InternshipDao(super.db);

  Stream<InternshipRequirement?> watchRequirements(int studentProfileId) {
    return (select(internshipRequirements)
          ..where((t) => t.studentProfileId.equals(studentProfileId))
          ..limit(1))
        .watchSingleOrNull();
  }

  Stream<List<InternshipAvailabilityData>> watchAvailability(
    int requirementId,
  ) {
    return (select(
      internshipAvailability,
    )..where((t) => t.internshipRequirementId.equals(requirementId))).watch();
  }

  Stream<List<InternshipSession>> watchCurrentWeekSessions() {
    // Simplified for now, should filter by current week
    return select(internshipSessions).watch();
  }

  Future<int> upsertRequirements(
    InternshipRequirementsCompanion requirements,
  ) async {
    final studentProfileId = requirements.studentProfileId.value;
    final existing =
        await (select(internshipRequirements)
              ..where(
                (table) => table.studentProfileId.equals(studentProfileId),
              )
              ..limit(1))
            .getSingleOrNull();

    if (existing == null) {
      return into(internshipRequirements).insert(requirements);
    }

    await (update(
      internshipRequirements,
    )..where((table) => table.id.equals(existing.id))).write(requirements);
    return existing.id;
  }
}
