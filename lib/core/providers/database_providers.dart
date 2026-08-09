import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/aster_database.dart';
import '../repositories/subjects_repository.dart';
import '../repositories/student_repository.dart';
import '../repositories/attendance_policy_repository.dart';
import '../repositories/attendance_repository.dart';
import '../repositories/weekly_plans_repository.dart';
import '../repositories/internship_repository.dart';
import '../repositories/timetable_repository.dart';
import '../models/attendance_summary.dart';

final databaseProvider = Provider<AsterDatabase>((ref) {
  final db = AsterDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final subjectsRepositoryProvider = Provider<SubjectsRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return SubjectsRepository(db.subjectsDao);
});

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return StudentRepository(db.studentProfileDao);
});

final attendancePolicyRepositoryProvider = Provider<AttendancePolicyRepository>(
  (ref) {
    final db = ref.watch(databaseProvider);
    return AttendancePolicyRepository(db.attendancePolicyDao);
  },
);

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AttendanceRepository(db.attendanceDao);
});

final weeklyPlansRepositoryProvider = Provider<WeeklyPlansRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return WeeklyPlansRepository(db.weeklyPlansDao);
});

final internshipRepositoryProvider = Provider<InternshipRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return InternshipRepository(db.internshipDao);
});

final timetableRepositoryProvider = Provider<TimetableRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TimetableRepository(db.timetableDao, db);
});

final activeSubjectsProvider = StreamProvider<List<Subject>>((ref) {
  return ref.watch(subjectsRepositoryProvider).watchActiveSubjects();
});

final subjectDetailProvider = StreamProvider.family<Subject, int>((ref, id) {
  return ref.watch(subjectsRepositoryProvider).watchSubjectById(id);
});

final subjectAttendanceHistoryProvider =
    StreamProvider.family<List<AttendanceRecord>, int>((ref, subjectId) {
      return ref
          .watch(attendanceRepositoryProvider)
          .watchAttendanceHistory(subjectId);
    });

final subjectAttendanceSummaryProvider =
    StreamProvider.family<AttendanceSummary, int>((ref, subjectId) {
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
    });

final currentStudentProfileProvider = StreamProvider<StudentProfile?>((ref) {
  return ref.watch(studentRepositoryProvider).watchProfile();
});

final selectedWeeklyPlanProvider = StreamProvider.family<WeeklyPlan?, DateTime>(
  (ref, weekStartDate) {
    return ref
        .watch(weeklyPlansRepositoryProvider)
        .watchSelectedPlan(weekStartDate);
  },
);

final weeklyPlanDaysProvider = StreamProvider.family<List<WeeklyPlanDay>, int>((
  ref,
  planId,
) {
  return ref.watch(weeklyPlansRepositoryProvider).watchPlanDays(planId);
});

final internshipRequirementsProvider = StreamProvider<InternshipRequirement?>((
  ref,
) {
  final profileAsync = ref.watch(currentStudentProfileProvider);
  final profile = profileAsync.value;
  if (profile == null) return Stream.value(null);
  return ref.watch(internshipRepositoryProvider).watchRequirements(profile.id);
});

final internshipAvailabilityProvider =
    StreamProvider.family<List<InternshipAvailabilityData>, int>((
      ref,
      requirementId,
    ) {
      return ref
          .watch(internshipRepositoryProvider)
          .watchAvailability(requirementId);
    });
