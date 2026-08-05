import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'lecture_sessions_dao.g.dart';

@DriftAccessor(tables: [LectureSessions])
class LectureSessionsDao extends DatabaseAccessor<AsterDatabase>
    with _$LectureSessionsDaoMixin {
  LectureSessionsDao(super.db);

  Stream<List<LectureSession>> watchUpcomingLectureSessions(int subjectId) {
    return (select(lectureSessions)
          ..where(
            (t) =>
                t.subjectId.equals(subjectId) &
                t.sessionDate.isBiggerThanValue(DateTime.now()),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.sessionDate)]))
        .watch();
  }

  Future<int> insertSession(LectureSessionsCompanion session) =>
      into(lectureSessions).insert(session);

  Future updateSessionStatus(int id, String status) {
    return (update(lectureSessions)..where((t) => t.id.equals(id))).write(
      LectureSessionsCompanion(sessionStatus: Value(status)),
    );
  }
}
