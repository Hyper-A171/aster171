import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database/aster_database.dart';
import '../repositories/subjects_repository.dart';
import '../repositories/student_repository.dart';
import '../repositories/attendance_policy_repository.dart';
import '../repositories/attendance_repository.dart';
import '../models/attendance_summary.dart';

part 'database_providers.g.dart';

@Riverpod(keepAlive: true)
AsterDatabase database(DatabaseRef ref) {
  final db = AsterDatabase();
  ref.onDispose(() => db.close());
  return db;
}

@Riverpod(keepAlive: true)
SubjectsRepository subjectsRepository(SubjectsRepositoryRef ref) {
  final db = ref.watch(databaseProvider);
  return SubjectsRepository(db.subjectsDao);
}

@Riverpod(keepAlive: true)
StudentRepository studentRepository(StudentRepositoryRef ref) {
  final db = ref.watch(databaseProvider);
  return StudentRepository(db.studentProfileDao);
}

@Riverpod(keepAlive: true)
AttendancePolicyRepository attendancePolicyRepository(
  AttendancePolicyRepositoryRef ref,
) {
  final db = ref.watch(databaseProvider);
  return AttendancePolicyRepository(db.attendancePolicyDao);
}

@Riverpod(keepAlive: true)
AttendanceRepository attendanceRepository(AttendanceRepositoryRef ref) {
  final db = ref.watch(databaseProvider);
  return AttendanceRepository(db.attendanceDao, db.lectureSessionsDao);
}

@riverpod
Stream<List<Subject>> activeSubjects(ActiveSubjectsRef ref) {
  return ref.watch(subjectsRepositoryProvider).watchActiveSubjects();
}

@riverpod
Stream<Subject> subjectDetail(SubjectDetailRef ref, int id) {
  return ref.watch(subjectsRepositoryProvider).watchSubjectById(id);
}

@riverpod
Stream<List<AttendanceRecord>> subjectAttendanceHistory(
  SubjectAttendanceHistoryRef ref,
  int subjectId,
) {
  return ref
      .watch(attendanceRepositoryProvider)
      .watchAttendanceHistory(subjectId);
}

@riverpod
Stream<AttendanceSummary> subjectAttendanceSummary(
  AttendanceSummaryRef ref,
  int subjectId,
) {
  final subjectAsync = ref.watch(subjectDetailProvider(subjectId));
  final rawSummaryStream = ref
      .watch(attendanceRepositoryProvider)
      .watchSubjectAttendanceSummary(subjectId);

  return rawSummaryStream.map((raw) {
    // We need the subject to get the required percentage
    final subject = subjectAsync.value;
    final requiredPct = subject?.requiredPercentageOverride ?? 75.0;

    return AttendanceSummary.calculate(
      attendedUnits: raw.attendedUnits,
      totalCountedUnits: raw.totalCountedUnits,
      requiredPercentage: requiredPct,
      presentCount: raw.presentCount,
      absentCount: raw.absentCount,
      cancelledCount: raw.cancelledCount,
      pendingCount: raw.pendingCount,
      excusedCount: raw.excusedCount,
    );
  });
}

@riverpod
Stream<StudentProfile?> currentStudentProfile(CurrentStudentProfileRef ref) {
  return ref.watch(studentRepositoryProvider).watchProfile();
}
