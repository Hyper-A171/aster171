import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'timetable_dao.g.dart';

@DriftAccessor(tables: [TimetableEntries])
class TimetableDao extends DatabaseAccessor<AsterDatabase>
    with _$TimetableDaoMixin {
  TimetableDao(super.db);

  Stream<List<TimetableEntry>> watchTimetable(int subjectId) {
    return (select(
      timetableEntries,
    )..where((t) => t.subjectId.equals(subjectId))).watch();
  }

  Future<int> insertEntry(TimetableEntriesCompanion entry) =>
      into(timetableEntries).insert(entry);

  Future deleteEntry(int id) =>
      (delete(timetableEntries)..where((t) => t.id.equals(id))).go();
}
