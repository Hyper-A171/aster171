import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'daos/attendance_dao.dart';
import 'daos/attendance_policy_dao.dart';
import 'daos/internship_dao.dart';
import 'daos/lecture_sessions_dao.dart';
import 'daos/student_profile_dao.dart';
import 'daos/subjects_dao.dart';
import 'daos/timetable_dao.dart';
import 'daos/weekly_plans_dao.dart';

part 'aster_database.g.dart';

// --- Table Definitions ---
// ... (rest of the code)

class StudentProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get collegeName => text().nullable()();
  TextColumn get course => text().nullable()();
  TextColumn get semesterName => text().nullable()();
  DateTimeColumn get semesterStartDate => dateTime().nullable()();
  DateTimeColumn get semesterEndDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class AttendancePolicies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentProfileId =>
      integer().references(StudentProfiles, #id, onDelete: KeyAction.cascade)();
  RealColumn get requiredPercentage =>
      real().withDefault(const Constant(75.0))();
  RealColumn get safetyTargetPercentage =>
      real().withDefault(const Constant(76.0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Subjects extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentProfileId =>
      integer().references(StudentProfiles, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get code => text().nullable()();
  TextColumn get subjectType => text()(); // Theory, Practical
  BoolColumn get isMandatory => boolean().withDefault(const Constant(true))();
  IntColumn get colorValue => integer().nullable()();
  RealColumn get requiredPercentageOverride => real().nullable()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class TimetableEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectId =>
      integer().references(Subjects, #id, onDelete: KeyAction.cascade)();
  IntColumn get weekday => integer()(); // 1-7 (Mon-Sun)
  IntColumn get startMinutes => integer()(); // Minutes from midnight
  IntColumn get endMinutes => integer()();
  RealColumn get attendanceUnits => real().withDefault(const Constant(1.0))();
  BoolColumn get isMandatory => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class LectureSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectId =>
      integer().references(Subjects, #id, onDelete: KeyAction.cascade)();
  IntColumn get timetableEntryId => integer().nullable().references(
    TimetableEntries,
    #id,
    onDelete: KeyAction.setNull,
  )();
  DateTimeColumn get sessionDate => dateTime()();
  IntColumn get startMinutes => integer()();
  IntColumn get endMinutes => integer()();
  RealColumn get attendanceUnits => real().withDefault(const Constant(1.0))();
  TextColumn get sessionStatus =>
      text()(); // scheduled, completed, cancelled, pending
  BoolColumn get isMandatory => boolean().withDefault(const Constant(true))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {subjectId, sessionDate, startMinutes},
  ];
}

class AttendanceRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lectureSessionId =>
      integer().references(LectureSessions, #id, onDelete: KeyAction.cascade)();
  IntColumn get subjectId =>
      integer().references(Subjects, #id, onDelete: KeyAction.cascade)();
  TextColumn get attendanceStatus =>
      text()(); // present, absent, cancelled, pending, excused
  RealColumn get countedUnits => real().withDefault(const Constant(1.0))();
  RealColumn get attendedUnits => real().withDefault(const Constant(0.0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {lectureSessionId},
  ];
}

class InternshipRequirements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentProfileId =>
      integer().references(StudentProfiles, #id, onDelete: KeyAction.cascade)();
  IntColumn get requiredDaysPerWeek =>
      integer().withDefault(const Constant(3))();
  IntColumn get requiredHoursPerWeek => integer().nullable()();
  DateTimeColumn get internshipStartDate => dateTime().nullable()();
  DateTimeColumn get internshipEndDate => dateTime().nullable()();
  TextColumn get courseCode => text().nullable()();
  BoolColumn get allowsHalfDay =>
      boolean().withDefault(const Constant(false))();
  IntColumn get startMinutes => integer().nullable()();
  IntColumn get endMinutes => integer().nullable()();
  IntColumn get travelMinutes => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class InternshipAvailability extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get internshipRequirementId => integer().references(
    InternshipRequirements,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get weekday => integer()();
  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();
  BoolColumn get isFixed => boolean().withDefault(const Constant(false))();
  TextColumn get availabilityType => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class InternshipSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get sessionDate => dateTime()();
  IntColumn get startMinutes => integer()();
  IntColumn get endMinutes => integer()();
  TextColumn get sessionType => text()();
  TextColumn get status => text()();
  IntColumn get completedMinutes => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class WeeklyPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get weekStartDate => dateTime()();
  TextColumn get planType => text()();
  RealColumn get riskScore => real().nullable()();
  BoolColumn get isSelected => boolean().withDefault(const Constant(false))();
  BoolColumn get isValid => boolean().withDefault(const Constant(true))();
  TextColumn get explanation => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class WeeklyPlanDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weeklyPlanId =>
      integer().references(WeeklyPlans, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  TextColumn get dayType =>
      text()(); // college, internship, collegeAndInternship, holiday, flexible
  TextColumn get warning => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {weeklyPlanId, date},
  ];
}

// --- Database Class ---

@DriftDatabase(
  tables: [
    StudentProfiles,
    AttendancePolicies,
    Subjects,
    TimetableEntries,
    LectureSessions,
    AttendanceRecords,
    InternshipRequirements,
    InternshipAvailability,
    InternshipSessions,
    WeeklyPlans,
    WeeklyPlanDays,
  ],
  daos: [
    StudentProfileDao,
    AttendancePolicyDao,
    SubjectsDao,
    TimetableDao,
    LectureSessionsDao,
    AttendanceDao,
    InternshipDao,
    WeeklyPlansDao,
  ],
)
class AsterDatabase extends _$AsterDatabase {
  AsterDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  Future<void> applyFifthSemesterDefaults(int profileId) async {
    const curriculum = [
      ('Operating System', '315319', 'DSC', true),
      ('Software Engineering', '315323', 'DSC', true),
      ('Entrepreneurship Development and Startups', '315002', 'AEC', true),
      ('Seminar and Project Initiation Course', '315003', 'AEC', true),
      ('Internship (12 weeks)', '315004', 'INP', true),
      ('Advanced Computer Network', '315321', 'DSE', false),
    ];

    for (final item in curriculum) {
      final exists =
          await (select(subjects)
                ..where(
                  (table) =>
                      table.studentProfileId.equals(profileId) &
                      table.code.equals(item.$2),
                )
                ..limit(1))
              .getSingleOrNull();
      if (exists == null) {
        await into(subjects).insert(
          SubjectsCompanion.insert(
            studentProfileId: profileId,
            name: item.$1,
            code: Value(item.$2),
            subjectType: item.$3,
            isMandatory: Value(item.$4),
          ),
        );
      }
    }
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(
          internshipRequirements,
          internshipRequirements.internshipStartDate,
        );
        await migrator.addColumn(
          internshipRequirements,
          internshipRequirements.internshipEndDate,
        );
        await migrator.addColumn(
          internshipRequirements,
          internshipRequirements.courseCode,
        );

        await update(studentProfiles).write(
          StudentProfilesCompanion(
            course: const Value('Diploma in Computer Engineering'),
            semesterName: const Value('Semester 5'),
            semesterStartDate: Value(DateTime(2026, 8, 10)),
          ),
        );
        await update(internshipRequirements).write(
          InternshipRequirementsCompanion(
            requiredHoursPerWeek: const Value(40),
            internshipStartDate: Value(DateTime(2026, 6, 1)),
            internshipEndDate: Value(DateTime(2026, 8, 29)),
            courseCode: const Value('315004'),
          ),
        );

        final profiles = await select(studentProfiles).get();
        for (final profile in profiles) {
          await applyFifthSemesterDefaults(profile.id);
        }
      }
      if (from < 3) {
        await update(attendancePolicies).write(
          const AttendancePoliciesCompanion(
            requiredPercentage: Value(75.0),
            safetyTargetPercentage: Value(76.0),
          ),
        );
        await update(internshipRequirements).write(
          const InternshipRequirementsCompanion(
            requiredDaysPerWeek: Value(3),
            allowsHalfDay: Value(false),
          ),
        );

        final requirements = await select(internshipRequirements).get();
        for (final requirement in requirements) {
          await (delete(internshipAvailability)..where(
                (table) => table.internshipRequirementId.equals(requirement.id),
              ))
              .go();
          for (var weekday = 1; weekday <= 7; weekday++) {
            await into(internshipAvailability).insert(
              InternshipAvailabilityCompanion.insert(
                internshipRequirementId: requirement.id,
                weekday: weekday,
                isAvailable: Value({1, 2, 3}.contains(weekday)),
                isFixed: const Value(false),
              ),
            );
          }
        }
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'aster.sqlite'));
    return NativeDatabase(file);
  });
}
