import 'package:drift/drift.dart';
import '../aster_database.dart';
import '../../models/attendance_summary.dart';
import '../../widgets/cards/aster_status_card.dart';
import '../../services/attendance_risk_evaluator.dart';

part 'attendance_dao.g.dart';

@DriftAccessor(tables: [AttendanceRecords, LectureSessions])
class AttendanceDao extends DatabaseAccessor<AsterDatabase>
    with _$AttendanceDaoMixin {
  AttendanceDao(super.db);

  Stream<List<AttendanceRecord>> watchAttendanceHistory(int subjectId) {
    return (select(attendanceRecords)
          ..where((t) => t.subjectId.equals(subjectId))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Stream<AttendanceSummary> watchSubjectAttendanceSummary(int subjectId) {
    return (select(
      attendanceRecords,
    )..where((t) => t.subjectId.equals(subjectId))).watch().map((records) {
      double attended = 0.0;
      double counted = 0.0;
      int present = 0;
      int absent = 0;
      int cancelled = 0;
      int pending = 0;
      int excused = 0;

      for (final record in records) {
        final status = record.attendanceStatus.toLowerCase();
        switch (status) {
          case 'present':
            attended += record.attendedUnits;
            counted += record.countedUnits;
            present++;
            break;
          case 'absent':
            counted += record.countedUnits;
            absent++;
            break;
          case 'cancelled':
            cancelled++;
            break;
          case 'pending':
            pending++;
            break;
          case 'excused':
            excused++;
            break;
        }
      }

      return AttendanceSummary(
        attendedUnits: attended,
        totalCountedUnits: counted,
        // These will be properly calculated in the provider/repository layer
        // using AttendanceSummary.calculate
        currentPercentage: 0,
        safeAbsences: 0,
        recoveryNeeded: 0,
        riskStatus: AsterStatus.safe,
        presentCount: present,
        absentCount: absent,
        cancelledCount: cancelled,
        pendingCount: pending,
        excusedCount: excused,
      );
    });
  }

  Future<int> insertAttendance(AttendanceRecordsCompanion record) =>
      into(attendanceRecords).insert(record);

  Future updateAttendance(AttendanceRecordsCompanion record) =>
      update(attendanceRecords).replace(record);

  Future deleteAttendance(int id) =>
      (delete(attendanceRecords)..where((t) => t.id.equals(id))).go();

  /// Perform atomic transaction to mark attendance for a lecture session.
  Future<void> markAttendanceTransaction({
    required int lectureSessionId,
    required int subjectId,
    required String status,
    required double countedUnits,
    required double attendedUnits,
    String? notes,
  }) async {
    return transaction(() async {
      // 1. Update session status
      final now = DateTime.now();
      await (update(
        db.lectureSessions,
      )..where((t) => t.id.equals(lectureSessionId))).write(
        LectureSessionsCompanion(
          sessionStatus: Value(status),
          updatedAt: Value(now),
        ),
      );

      // 2. Upsert attendance record (using unique key on lectureSessionId)
      final existingRecord =
          await (select(attendanceRecords)
                ..where((t) => t.lectureSessionId.equals(lectureSessionId)))
              .getSingleOrNull();

      if (existingRecord != null) {
        await (update(
          attendanceRecords,
        )..where((t) => t.id.equals(existingRecord.id))).write(
          AttendanceRecordsCompanion(
            attendanceStatus: Value(status),
            countedUnits: Value(countedUnits),
            attendedUnits: Value(attendedUnits),
            notes: Value(notes),
            updatedAt: Value(now),
          ),
        );
      } else {
        await into(attendanceRecords).insert(
          AttendanceRecordsCompanion.insert(
            lectureSessionId: lectureSessionId,
            subjectId: subjectId,
            attendanceStatus: status,
            countedUnits: Value(countedUnits),
            attendedUnits: Value(attendedUnits),
            notes: Value(notes),
            createdAt: Value(now),
            updatedAt: Value(now),
          ),
        );
      }
    });
  }

  /// Perform atomic transaction to correct or delete attendance record.
  Future<void> correctOrDeleteAttendanceTransaction({
    required int attendanceRecordId,
    required String newStatus,
    required double newCountedUnits,
    required double newAttendedUnits,
  }) async {
    return transaction(() async {
      final existing = await (select(
        attendanceRecords,
      )..where((t) => t.id.equals(attendanceRecordId))).getSingleOrNull();
      if (existing == null) return;

      final now = DateTime.now();
      // Update attendance record
      await (update(
        attendanceRecords,
      )..where((t) => t.id.equals(attendanceRecordId))).write(
        AttendanceRecordsCompanion(
          attendanceStatus: Value(newStatus),
          countedUnits: Value(newCountedUnits),
          attendedUnits: Value(newAttendedUnits),
          updatedAt: Value(now),
        ),
      );

      // Update associated lecture session
      await (update(
        db.lectureSessions,
      )..where((t) => t.id.equals(existing.lectureSessionId))).write(
        LectureSessionsCompanion(
          sessionStatus: Value(newStatus),
          updatedAt: Value(now),
        ),
      );
    });
  }
}
