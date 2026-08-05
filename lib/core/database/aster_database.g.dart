// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aster_database.dart';

// ignore_for_file: type=lint
class $StudentProfilesTable extends StudentProfiles
    with TableInfo<$StudentProfilesTable, StudentProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _collegeNameMeta = const VerificationMeta(
    'collegeName',
  );
  @override
  late final GeneratedColumn<String> collegeName = GeneratedColumn<String>(
    'college_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _courseMeta = const VerificationMeta('course');
  @override
  late final GeneratedColumn<String> course = GeneratedColumn<String>(
    'course',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _semesterNameMeta = const VerificationMeta(
    'semesterName',
  );
  @override
  late final GeneratedColumn<String> semesterName = GeneratedColumn<String>(
    'semester_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _semesterStartDateMeta = const VerificationMeta(
    'semesterStartDate',
  );
  @override
  late final GeneratedColumn<DateTime> semesterStartDate =
      GeneratedColumn<DateTime>(
        'semester_start_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _semesterEndDateMeta = const VerificationMeta(
    'semesterEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> semesterEndDate =
      GeneratedColumn<DateTime>(
        'semester_end_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    collegeName,
    course,
    semesterName,
    semesterStartDate,
    semesterEndDate,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('college_name')) {
      context.handle(
        _collegeNameMeta,
        collegeName.isAcceptableOrUnknown(
          data['college_name']!,
          _collegeNameMeta,
        ),
      );
    }
    if (data.containsKey('course')) {
      context.handle(
        _courseMeta,
        course.isAcceptableOrUnknown(data['course']!, _courseMeta),
      );
    }
    if (data.containsKey('semester_name')) {
      context.handle(
        _semesterNameMeta,
        semesterName.isAcceptableOrUnknown(
          data['semester_name']!,
          _semesterNameMeta,
        ),
      );
    }
    if (data.containsKey('semester_start_date')) {
      context.handle(
        _semesterStartDateMeta,
        semesterStartDate.isAcceptableOrUnknown(
          data['semester_start_date']!,
          _semesterStartDateMeta,
        ),
      );
    }
    if (data.containsKey('semester_end_date')) {
      context.handle(
        _semesterEndDateMeta,
        semesterEndDate.isAcceptableOrUnknown(
          data['semester_end_date']!,
          _semesterEndDateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      collegeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}college_name'],
      ),
      course: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course'],
      ),
      semesterName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}semester_name'],
      ),
      semesterStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}semester_start_date'],
      ),
      semesterEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}semester_end_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StudentProfilesTable createAlias(String alias) {
    return $StudentProfilesTable(attachedDatabase, alias);
  }
}

class StudentProfile extends DataClass implements Insertable<StudentProfile> {
  final int id;
  final String name;
  final String? collegeName;
  final String? course;
  final String? semesterName;
  final DateTime? semesterStartDate;
  final DateTime? semesterEndDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const StudentProfile({
    required this.id,
    required this.name,
    this.collegeName,
    this.course,
    this.semesterName,
    this.semesterStartDate,
    this.semesterEndDate,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || collegeName != null) {
      map['college_name'] = Variable<String>(collegeName);
    }
    if (!nullToAbsent || course != null) {
      map['course'] = Variable<String>(course);
    }
    if (!nullToAbsent || semesterName != null) {
      map['semester_name'] = Variable<String>(semesterName);
    }
    if (!nullToAbsent || semesterStartDate != null) {
      map['semester_start_date'] = Variable<DateTime>(semesterStartDate);
    }
    if (!nullToAbsent || semesterEndDate != null) {
      map['semester_end_date'] = Variable<DateTime>(semesterEndDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StudentProfilesCompanion toCompanion(bool nullToAbsent) {
    return StudentProfilesCompanion(
      id: Value(id),
      name: Value(name),
      collegeName: collegeName == null && nullToAbsent
          ? const Value.absent()
          : Value(collegeName),
      course: course == null && nullToAbsent
          ? const Value.absent()
          : Value(course),
      semesterName: semesterName == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterName),
      semesterStartDate: semesterStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterStartDate),
      semesterEndDate: semesterEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterEndDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory StudentProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentProfile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      collegeName: serializer.fromJson<String?>(json['collegeName']),
      course: serializer.fromJson<String?>(json['course']),
      semesterName: serializer.fromJson<String?>(json['semesterName']),
      semesterStartDate: serializer.fromJson<DateTime?>(
        json['semesterStartDate'],
      ),
      semesterEndDate: serializer.fromJson<DateTime?>(json['semesterEndDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'collegeName': serializer.toJson<String?>(collegeName),
      'course': serializer.toJson<String?>(course),
      'semesterName': serializer.toJson<String?>(semesterName),
      'semesterStartDate': serializer.toJson<DateTime?>(semesterStartDate),
      'semesterEndDate': serializer.toJson<DateTime?>(semesterEndDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StudentProfile copyWith({
    int? id,
    String? name,
    Value<String?> collegeName = const Value.absent(),
    Value<String?> course = const Value.absent(),
    Value<String?> semesterName = const Value.absent(),
    Value<DateTime?> semesterStartDate = const Value.absent(),
    Value<DateTime?> semesterEndDate = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => StudentProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    collegeName: collegeName.present ? collegeName.value : this.collegeName,
    course: course.present ? course.value : this.course,
    semesterName: semesterName.present ? semesterName.value : this.semesterName,
    semesterStartDate: semesterStartDate.present
        ? semesterStartDate.value
        : this.semesterStartDate,
    semesterEndDate: semesterEndDate.present
        ? semesterEndDate.value
        : this.semesterEndDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StudentProfile copyWithCompanion(StudentProfilesCompanion data) {
    return StudentProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      collegeName: data.collegeName.present
          ? data.collegeName.value
          : this.collegeName,
      course: data.course.present ? data.course.value : this.course,
      semesterName: data.semesterName.present
          ? data.semesterName.value
          : this.semesterName,
      semesterStartDate: data.semesterStartDate.present
          ? data.semesterStartDate.value
          : this.semesterStartDate,
      semesterEndDate: data.semesterEndDate.present
          ? data.semesterEndDate.value
          : this.semesterEndDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('collegeName: $collegeName, ')
          ..write('course: $course, ')
          ..write('semesterName: $semesterName, ')
          ..write('semesterStartDate: $semesterStartDate, ')
          ..write('semesterEndDate: $semesterEndDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    collegeName,
    course,
    semesterName,
    semesterStartDate,
    semesterEndDate,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.collegeName == this.collegeName &&
          other.course == this.course &&
          other.semesterName == this.semesterName &&
          other.semesterStartDate == this.semesterStartDate &&
          other.semesterEndDate == this.semesterEndDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StudentProfilesCompanion extends UpdateCompanion<StudentProfile> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> collegeName;
  final Value<String?> course;
  final Value<String?> semesterName;
  final Value<DateTime?> semesterStartDate;
  final Value<DateTime?> semesterEndDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StudentProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.collegeName = const Value.absent(),
    this.course = const Value.absent(),
    this.semesterName = const Value.absent(),
    this.semesterStartDate = const Value.absent(),
    this.semesterEndDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StudentProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.collegeName = const Value.absent(),
    this.course = const Value.absent(),
    this.semesterName = const Value.absent(),
    this.semesterStartDate = const Value.absent(),
    this.semesterEndDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<StudentProfile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? collegeName,
    Expression<String>? course,
    Expression<String>? semesterName,
    Expression<DateTime>? semesterStartDate,
    Expression<DateTime>? semesterEndDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (collegeName != null) 'college_name': collegeName,
      if (course != null) 'course': course,
      if (semesterName != null) 'semester_name': semesterName,
      if (semesterStartDate != null) 'semester_start_date': semesterStartDate,
      if (semesterEndDate != null) 'semester_end_date': semesterEndDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StudentProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? collegeName,
    Value<String?>? course,
    Value<String?>? semesterName,
    Value<DateTime?>? semesterStartDate,
    Value<DateTime?>? semesterEndDate,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StudentProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      collegeName: collegeName ?? this.collegeName,
      course: course ?? this.course,
      semesterName: semesterName ?? this.semesterName,
      semesterStartDate: semesterStartDate ?? this.semesterStartDate,
      semesterEndDate: semesterEndDate ?? this.semesterEndDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (collegeName.present) {
      map['college_name'] = Variable<String>(collegeName.value);
    }
    if (course.present) {
      map['course'] = Variable<String>(course.value);
    }
    if (semesterName.present) {
      map['semester_name'] = Variable<String>(semesterName.value);
    }
    if (semesterStartDate.present) {
      map['semester_start_date'] = Variable<DateTime>(semesterStartDate.value);
    }
    if (semesterEndDate.present) {
      map['semester_end_date'] = Variable<DateTime>(semesterEndDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('collegeName: $collegeName, ')
          ..write('course: $course, ')
          ..write('semesterName: $semesterName, ')
          ..write('semesterStartDate: $semesterStartDate, ')
          ..write('semesterEndDate: $semesterEndDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AttendancePoliciesTable extends AttendancePolicies
    with TableInfo<$AttendancePoliciesTable, AttendancePolicy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendancePoliciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentProfileIdMeta = const VerificationMeta(
    'studentProfileId',
  );
  @override
  late final GeneratedColumn<int> studentProfileId = GeneratedColumn<int>(
    'student_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES student_profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _requiredPercentageMeta =
      const VerificationMeta('requiredPercentage');
  @override
  late final GeneratedColumn<double> requiredPercentage =
      GeneratedColumn<double>(
        'required_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(75.0),
      );
  static const VerificationMeta _safetyTargetPercentageMeta =
      const VerificationMeta('safetyTargetPercentage');
  @override
  late final GeneratedColumn<double> safetyTargetPercentage =
      GeneratedColumn<double>(
        'safety_target_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(80.0),
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentProfileId,
    requiredPercentage,
    safetyTargetPercentage,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_policies';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendancePolicy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_profile_id')) {
      context.handle(
        _studentProfileIdMeta,
        studentProfileId.isAcceptableOrUnknown(
          data['student_profile_id']!,
          _studentProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studentProfileIdMeta);
    }
    if (data.containsKey('required_percentage')) {
      context.handle(
        _requiredPercentageMeta,
        requiredPercentage.isAcceptableOrUnknown(
          data['required_percentage']!,
          _requiredPercentageMeta,
        ),
      );
    }
    if (data.containsKey('safety_target_percentage')) {
      context.handle(
        _safetyTargetPercentageMeta,
        safetyTargetPercentage.isAcceptableOrUnknown(
          data['safety_target_percentage']!,
          _safetyTargetPercentageMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendancePolicy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendancePolicy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_profile_id'],
      )!,
      requiredPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}required_percentage'],
      )!,
      safetyTargetPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}safety_target_percentage'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AttendancePoliciesTable createAlias(String alias) {
    return $AttendancePoliciesTable(attachedDatabase, alias);
  }
}

class AttendancePolicy extends DataClass
    implements Insertable<AttendancePolicy> {
  final int id;
  final int studentProfileId;
  final double requiredPercentage;
  final double safetyTargetPercentage;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AttendancePolicy({
    required this.id,
    required this.studentProfileId,
    required this.requiredPercentage,
    required this.safetyTargetPercentage,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_profile_id'] = Variable<int>(studentProfileId);
    map['required_percentage'] = Variable<double>(requiredPercentage);
    map['safety_target_percentage'] = Variable<double>(safetyTargetPercentage);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AttendancePoliciesCompanion toCompanion(bool nullToAbsent) {
    return AttendancePoliciesCompanion(
      id: Value(id),
      studentProfileId: Value(studentProfileId),
      requiredPercentage: Value(requiredPercentage),
      safetyTargetPercentage: Value(safetyTargetPercentage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AttendancePolicy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendancePolicy(
      id: serializer.fromJson<int>(json['id']),
      studentProfileId: serializer.fromJson<int>(json['studentProfileId']),
      requiredPercentage: serializer.fromJson<double>(
        json['requiredPercentage'],
      ),
      safetyTargetPercentage: serializer.fromJson<double>(
        json['safetyTargetPercentage'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentProfileId': serializer.toJson<int>(studentProfileId),
      'requiredPercentage': serializer.toJson<double>(requiredPercentage),
      'safetyTargetPercentage': serializer.toJson<double>(
        safetyTargetPercentage,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AttendancePolicy copyWith({
    int? id,
    int? studentProfileId,
    double? requiredPercentage,
    double? safetyTargetPercentage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AttendancePolicy(
    id: id ?? this.id,
    studentProfileId: studentProfileId ?? this.studentProfileId,
    requiredPercentage: requiredPercentage ?? this.requiredPercentage,
    safetyTargetPercentage:
        safetyTargetPercentage ?? this.safetyTargetPercentage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AttendancePolicy copyWithCompanion(AttendancePoliciesCompanion data) {
    return AttendancePolicy(
      id: data.id.present ? data.id.value : this.id,
      studentProfileId: data.studentProfileId.present
          ? data.studentProfileId.value
          : this.studentProfileId,
      requiredPercentage: data.requiredPercentage.present
          ? data.requiredPercentage.value
          : this.requiredPercentage,
      safetyTargetPercentage: data.safetyTargetPercentage.present
          ? data.safetyTargetPercentage.value
          : this.safetyTargetPercentage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendancePolicy(')
          ..write('id: $id, ')
          ..write('studentProfileId: $studentProfileId, ')
          ..write('requiredPercentage: $requiredPercentage, ')
          ..write('safetyTargetPercentage: $safetyTargetPercentage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentProfileId,
    requiredPercentage,
    safetyTargetPercentage,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendancePolicy &&
          other.id == this.id &&
          other.studentProfileId == this.studentProfileId &&
          other.requiredPercentage == this.requiredPercentage &&
          other.safetyTargetPercentage == this.safetyTargetPercentage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AttendancePoliciesCompanion extends UpdateCompanion<AttendancePolicy> {
  final Value<int> id;
  final Value<int> studentProfileId;
  final Value<double> requiredPercentage;
  final Value<double> safetyTargetPercentage;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AttendancePoliciesCompanion({
    this.id = const Value.absent(),
    this.studentProfileId = const Value.absent(),
    this.requiredPercentage = const Value.absent(),
    this.safetyTargetPercentage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AttendancePoliciesCompanion.insert({
    this.id = const Value.absent(),
    required int studentProfileId,
    this.requiredPercentage = const Value.absent(),
    this.safetyTargetPercentage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : studentProfileId = Value(studentProfileId);
  static Insertable<AttendancePolicy> custom({
    Expression<int>? id,
    Expression<int>? studentProfileId,
    Expression<double>? requiredPercentage,
    Expression<double>? safetyTargetPercentage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentProfileId != null) 'student_profile_id': studentProfileId,
      if (requiredPercentage != null) 'required_percentage': requiredPercentage,
      if (safetyTargetPercentage != null)
        'safety_target_percentage': safetyTargetPercentage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AttendancePoliciesCompanion copyWith({
    Value<int>? id,
    Value<int>? studentProfileId,
    Value<double>? requiredPercentage,
    Value<double>? safetyTargetPercentage,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return AttendancePoliciesCompanion(
      id: id ?? this.id,
      studentProfileId: studentProfileId ?? this.studentProfileId,
      requiredPercentage: requiredPercentage ?? this.requiredPercentage,
      safetyTargetPercentage:
          safetyTargetPercentage ?? this.safetyTargetPercentage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentProfileId.present) {
      map['student_profile_id'] = Variable<int>(studentProfileId.value);
    }
    if (requiredPercentage.present) {
      map['required_percentage'] = Variable<double>(requiredPercentage.value);
    }
    if (safetyTargetPercentage.present) {
      map['safety_target_percentage'] = Variable<double>(
        safetyTargetPercentage.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendancePoliciesCompanion(')
          ..write('id: $id, ')
          ..write('studentProfileId: $studentProfileId, ')
          ..write('requiredPercentage: $requiredPercentage, ')
          ..write('safetyTargetPercentage: $safetyTargetPercentage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentProfileIdMeta = const VerificationMeta(
    'studentProfileId',
  );
  @override
  late final GeneratedColumn<int> studentProfileId = GeneratedColumn<int>(
    'student_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES student_profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subjectTypeMeta = const VerificationMeta(
    'subjectType',
  );
  @override
  late final GeneratedColumn<String> subjectType = GeneratedColumn<String>(
    'subject_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isMandatoryMeta = const VerificationMeta(
    'isMandatory',
  );
  @override
  late final GeneratedColumn<bool> isMandatory = GeneratedColumn<bool>(
    'is_mandatory',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_mandatory" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requiredPercentageOverrideMeta =
      const VerificationMeta('requiredPercentageOverride');
  @override
  late final GeneratedColumn<double> requiredPercentageOverride =
      GeneratedColumn<double>(
        'required_percentage_override',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentProfileId,
    name,
    code,
    subjectType,
    isMandatory,
    colorValue,
    requiredPercentageOverride,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_profile_id')) {
      context.handle(
        _studentProfileIdMeta,
        studentProfileId.isAcceptableOrUnknown(
          data['student_profile_id']!,
          _studentProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studentProfileIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('subject_type')) {
      context.handle(
        _subjectTypeMeta,
        subjectType.isAcceptableOrUnknown(
          data['subject_type']!,
          _subjectTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectTypeMeta);
    }
    if (data.containsKey('is_mandatory')) {
      context.handle(
        _isMandatoryMeta,
        isMandatory.isAcceptableOrUnknown(
          data['is_mandatory']!,
          _isMandatoryMeta,
        ),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('required_percentage_override')) {
      context.handle(
        _requiredPercentageOverrideMeta,
        requiredPercentageOverride.isAcceptableOrUnknown(
          data['required_percentage_override']!,
          _requiredPercentageOverrideMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_profile_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      subjectType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_type'],
      )!,
      isMandatory: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_mandatory'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      requiredPercentageOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}required_percentage_override'],
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final int studentProfileId;
  final String name;
  final String? code;
  final String subjectType;
  final bool isMandatory;
  final int? colorValue;
  final double? requiredPercentageOverride;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Subject({
    required this.id,
    required this.studentProfileId,
    required this.name,
    this.code,
    required this.subjectType,
    required this.isMandatory,
    this.colorValue,
    this.requiredPercentageOverride,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_profile_id'] = Variable<int>(studentProfileId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    map['subject_type'] = Variable<String>(subjectType);
    map['is_mandatory'] = Variable<bool>(isMandatory);
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    if (!nullToAbsent || requiredPercentageOverride != null) {
      map['required_percentage_override'] = Variable<double>(
        requiredPercentageOverride,
      );
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      studentProfileId: Value(studentProfileId),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      subjectType: Value(subjectType),
      isMandatory: Value(isMandatory),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      requiredPercentageOverride:
          requiredPercentageOverride == null && nullToAbsent
          ? const Value.absent()
          : Value(requiredPercentageOverride),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      studentProfileId: serializer.fromJson<int>(json['studentProfileId']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      subjectType: serializer.fromJson<String>(json['subjectType']),
      isMandatory: serializer.fromJson<bool>(json['isMandatory']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      requiredPercentageOverride: serializer.fromJson<double?>(
        json['requiredPercentageOverride'],
      ),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentProfileId': serializer.toJson<int>(studentProfileId),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'subjectType': serializer.toJson<String>(subjectType),
      'isMandatory': serializer.toJson<bool>(isMandatory),
      'colorValue': serializer.toJson<int?>(colorValue),
      'requiredPercentageOverride': serializer.toJson<double?>(
        requiredPercentageOverride,
      ),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Subject copyWith({
    int? id,
    int? studentProfileId,
    String? name,
    Value<String?> code = const Value.absent(),
    String? subjectType,
    bool? isMandatory,
    Value<int?> colorValue = const Value.absent(),
    Value<double?> requiredPercentageOverride = const Value.absent(),
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Subject(
    id: id ?? this.id,
    studentProfileId: studentProfileId ?? this.studentProfileId,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    subjectType: subjectType ?? this.subjectType,
    isMandatory: isMandatory ?? this.isMandatory,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    requiredPercentageOverride: requiredPercentageOverride.present
        ? requiredPercentageOverride.value
        : this.requiredPercentageOverride,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      studentProfileId: data.studentProfileId.present
          ? data.studentProfileId.value
          : this.studentProfileId,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      subjectType: data.subjectType.present
          ? data.subjectType.value
          : this.subjectType,
      isMandatory: data.isMandatory.present
          ? data.isMandatory.value
          : this.isMandatory,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      requiredPercentageOverride: data.requiredPercentageOverride.present
          ? data.requiredPercentageOverride.value
          : this.requiredPercentageOverride,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('studentProfileId: $studentProfileId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('subjectType: $subjectType, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('colorValue: $colorValue, ')
          ..write('requiredPercentageOverride: $requiredPercentageOverride, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentProfileId,
    name,
    code,
    subjectType,
    isMandatory,
    colorValue,
    requiredPercentageOverride,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.studentProfileId == this.studentProfileId &&
          other.name == this.name &&
          other.code == this.code &&
          other.subjectType == this.subjectType &&
          other.isMandatory == this.isMandatory &&
          other.colorValue == this.colorValue &&
          other.requiredPercentageOverride == this.requiredPercentageOverride &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<int> studentProfileId;
  final Value<String> name;
  final Value<String?> code;
  final Value<String> subjectType;
  final Value<bool> isMandatory;
  final Value<int?> colorValue;
  final Value<double?> requiredPercentageOverride;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.studentProfileId = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.subjectType = const Value.absent(),
    this.isMandatory = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.requiredPercentageOverride = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required int studentProfileId,
    required String name,
    this.code = const Value.absent(),
    required String subjectType,
    this.isMandatory = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.requiredPercentageOverride = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : studentProfileId = Value(studentProfileId),
       name = Value(name),
       subjectType = Value(subjectType);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<int>? studentProfileId,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? subjectType,
    Expression<bool>? isMandatory,
    Expression<int>? colorValue,
    Expression<double>? requiredPercentageOverride,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentProfileId != null) 'student_profile_id': studentProfileId,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (subjectType != null) 'subject_type': subjectType,
      if (isMandatory != null) 'is_mandatory': isMandatory,
      if (colorValue != null) 'color_value': colorValue,
      if (requiredPercentageOverride != null)
        'required_percentage_override': requiredPercentageOverride,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubjectsCompanion copyWith({
    Value<int>? id,
    Value<int>? studentProfileId,
    Value<String>? name,
    Value<String?>? code,
    Value<String>? subjectType,
    Value<bool>? isMandatory,
    Value<int?>? colorValue,
    Value<double?>? requiredPercentageOverride,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      studentProfileId: studentProfileId ?? this.studentProfileId,
      name: name ?? this.name,
      code: code ?? this.code,
      subjectType: subjectType ?? this.subjectType,
      isMandatory: isMandatory ?? this.isMandatory,
      colorValue: colorValue ?? this.colorValue,
      requiredPercentageOverride:
          requiredPercentageOverride ?? this.requiredPercentageOverride,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentProfileId.present) {
      map['student_profile_id'] = Variable<int>(studentProfileId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (subjectType.present) {
      map['subject_type'] = Variable<String>(subjectType.value);
    }
    if (isMandatory.present) {
      map['is_mandatory'] = Variable<bool>(isMandatory.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (requiredPercentageOverride.present) {
      map['required_percentage_override'] = Variable<double>(
        requiredPercentageOverride.value,
      );
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('studentProfileId: $studentProfileId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('subjectType: $subjectType, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('colorValue: $colorValue, ')
          ..write('requiredPercentageOverride: $requiredPercentageOverride, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TimetableEntriesTable extends TimetableEntries
    with TableInfo<$TimetableEntriesTable, TimetableEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetableEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attendanceUnitsMeta = const VerificationMeta(
    'attendanceUnits',
  );
  @override
  late final GeneratedColumn<double> attendanceUnits = GeneratedColumn<double>(
    'attendance_units',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _isMandatoryMeta = const VerificationMeta(
    'isMandatory',
  );
  @override
  late final GeneratedColumn<bool> isMandatory = GeneratedColumn<bool>(
    'is_mandatory',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_mandatory" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    weekday,
    startMinutes,
    endMinutes,
    attendanceUnits,
    isMandatory,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetable_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimetableEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    } else if (isInserting) {
      context.missing(_weekdayMeta);
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinutesMeta);
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinutesMeta);
    }
    if (data.containsKey('attendance_units')) {
      context.handle(
        _attendanceUnitsMeta,
        attendanceUnits.isAcceptableOrUnknown(
          data['attendance_units']!,
          _attendanceUnitsMeta,
        ),
      );
    }
    if (data.containsKey('is_mandatory')) {
      context.handle(
        _isMandatoryMeta,
        isMandatory.isAcceptableOrUnknown(
          data['is_mandatory']!,
          _isMandatoryMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimetableEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimetableEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      )!,
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      )!,
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      )!,
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      )!,
      attendanceUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}attendance_units'],
      )!,
      isMandatory: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_mandatory'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TimetableEntriesTable createAlias(String alias) {
    return $TimetableEntriesTable(attachedDatabase, alias);
  }
}

class TimetableEntry extends DataClass implements Insertable<TimetableEntry> {
  final int id;
  final int subjectId;
  final int weekday;
  final int startMinutes;
  final int endMinutes;
  final double attendanceUnits;
  final bool isMandatory;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TimetableEntry({
    required this.id,
    required this.subjectId,
    required this.weekday,
    required this.startMinutes,
    required this.endMinutes,
    required this.attendanceUnits,
    required this.isMandatory,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectId);
    map['weekday'] = Variable<int>(weekday);
    map['start_minutes'] = Variable<int>(startMinutes);
    map['end_minutes'] = Variable<int>(endMinutes);
    map['attendance_units'] = Variable<double>(attendanceUnits);
    map['is_mandatory'] = Variable<bool>(isMandatory);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TimetableEntriesCompanion toCompanion(bool nullToAbsent) {
    return TimetableEntriesCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      weekday: Value(weekday),
      startMinutes: Value(startMinutes),
      endMinutes: Value(endMinutes),
      attendanceUnits: Value(attendanceUnits),
      isMandatory: Value(isMandatory),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TimetableEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimetableEntry(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      weekday: serializer.fromJson<int>(json['weekday']),
      startMinutes: serializer.fromJson<int>(json['startMinutes']),
      endMinutes: serializer.fromJson<int>(json['endMinutes']),
      attendanceUnits: serializer.fromJson<double>(json['attendanceUnits']),
      isMandatory: serializer.fromJson<bool>(json['isMandatory']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'weekday': serializer.toJson<int>(weekday),
      'startMinutes': serializer.toJson<int>(startMinutes),
      'endMinutes': serializer.toJson<int>(endMinutes),
      'attendanceUnits': serializer.toJson<double>(attendanceUnits),
      'isMandatory': serializer.toJson<bool>(isMandatory),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TimetableEntry copyWith({
    int? id,
    int? subjectId,
    int? weekday,
    int? startMinutes,
    int? endMinutes,
    double? attendanceUnits,
    bool? isMandatory,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TimetableEntry(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    weekday: weekday ?? this.weekday,
    startMinutes: startMinutes ?? this.startMinutes,
    endMinutes: endMinutes ?? this.endMinutes,
    attendanceUnits: attendanceUnits ?? this.attendanceUnits,
    isMandatory: isMandatory ?? this.isMandatory,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TimetableEntry copyWithCompanion(TimetableEntriesCompanion data) {
    return TimetableEntry(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
      attendanceUnits: data.attendanceUnits.present
          ? data.attendanceUnits.value
          : this.attendanceUnits,
      isMandatory: data.isMandatory.present
          ? data.isMandatory.value
          : this.isMandatory,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimetableEntry(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('weekday: $weekday, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('attendanceUnits: $attendanceUnits, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    weekday,
    startMinutes,
    endMinutes,
    attendanceUnits,
    isMandatory,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimetableEntry &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.weekday == this.weekday &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes &&
          other.attendanceUnits == this.attendanceUnits &&
          other.isMandatory == this.isMandatory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TimetableEntriesCompanion extends UpdateCompanion<TimetableEntry> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<int> weekday;
  final Value<int> startMinutes;
  final Value<int> endMinutes;
  final Value<double> attendanceUnits;
  final Value<bool> isMandatory;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TimetableEntriesCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.weekday = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.attendanceUnits = const Value.absent(),
    this.isMandatory = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TimetableEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required int weekday,
    required int startMinutes,
    required int endMinutes,
    this.attendanceUnits = const Value.absent(),
    this.isMandatory = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : subjectId = Value(subjectId),
       weekday = Value(weekday),
       startMinutes = Value(startMinutes),
       endMinutes = Value(endMinutes);
  static Insertable<TimetableEntry> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<int>? weekday,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
    Expression<double>? attendanceUnits,
    Expression<bool>? isMandatory,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (weekday != null) 'weekday': weekday,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
      if (attendanceUnits != null) 'attendance_units': attendanceUnits,
      if (isMandatory != null) 'is_mandatory': isMandatory,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TimetableEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? subjectId,
    Value<int>? weekday,
    Value<int>? startMinutes,
    Value<int>? endMinutes,
    Value<double>? attendanceUnits,
    Value<bool>? isMandatory,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TimetableEntriesCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      weekday: weekday ?? this.weekday,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      attendanceUnits: attendanceUnits ?? this.attendanceUnits,
      isMandatory: isMandatory ?? this.isMandatory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    if (attendanceUnits.present) {
      map['attendance_units'] = Variable<double>(attendanceUnits.value);
    }
    if (isMandatory.present) {
      map['is_mandatory'] = Variable<bool>(isMandatory.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetableEntriesCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('weekday: $weekday, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('attendanceUnits: $attendanceUnits, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LectureSessionsTable extends LectureSessions
    with TableInfo<$LectureSessionsTable, LectureSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LectureSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _timetableEntryIdMeta = const VerificationMeta(
    'timetableEntryId',
  );
  @override
  late final GeneratedColumn<int> timetableEntryId = GeneratedColumn<int>(
    'timetable_entry_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timetable_entries (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _sessionDateMeta = const VerificationMeta(
    'sessionDate',
  );
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
    'session_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attendanceUnitsMeta = const VerificationMeta(
    'attendanceUnits',
  );
  @override
  late final GeneratedColumn<double> attendanceUnits = GeneratedColumn<double>(
    'attendance_units',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _sessionStatusMeta = const VerificationMeta(
    'sessionStatus',
  );
  @override
  late final GeneratedColumn<String> sessionStatus = GeneratedColumn<String>(
    'session_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isMandatoryMeta = const VerificationMeta(
    'isMandatory',
  );
  @override
  late final GeneratedColumn<bool> isMandatory = GeneratedColumn<bool>(
    'is_mandatory',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_mandatory" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    timetableEntryId,
    sessionDate,
    startMinutes,
    endMinutes,
    attendanceUnits,
    sessionStatus,
    isMandatory,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lecture_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<LectureSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('timetable_entry_id')) {
      context.handle(
        _timetableEntryIdMeta,
        timetableEntryId.isAcceptableOrUnknown(
          data['timetable_entry_id']!,
          _timetableEntryIdMeta,
        ),
      );
    }
    if (data.containsKey('session_date')) {
      context.handle(
        _sessionDateMeta,
        sessionDate.isAcceptableOrUnknown(
          data['session_date']!,
          _sessionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionDateMeta);
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinutesMeta);
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinutesMeta);
    }
    if (data.containsKey('attendance_units')) {
      context.handle(
        _attendanceUnitsMeta,
        attendanceUnits.isAcceptableOrUnknown(
          data['attendance_units']!,
          _attendanceUnitsMeta,
        ),
      );
    }
    if (data.containsKey('session_status')) {
      context.handle(
        _sessionStatusMeta,
        sessionStatus.isAcceptableOrUnknown(
          data['session_status']!,
          _sessionStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionStatusMeta);
    }
    if (data.containsKey('is_mandatory')) {
      context.handle(
        _isMandatoryMeta,
        isMandatory.isAcceptableOrUnknown(
          data['is_mandatory']!,
          _isMandatoryMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {subjectId, sessionDate, startMinutes},
  ];
  @override
  LectureSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LectureSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      )!,
      timetableEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timetable_entry_id'],
      ),
      sessionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}session_date'],
      )!,
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      )!,
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      )!,
      attendanceUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}attendance_units'],
      )!,
      sessionStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_status'],
      )!,
      isMandatory: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_mandatory'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LectureSessionsTable createAlias(String alias) {
    return $LectureSessionsTable(attachedDatabase, alias);
  }
}

class LectureSession extends DataClass implements Insertable<LectureSession> {
  final int id;
  final int subjectId;
  final int? timetableEntryId;
  final DateTime sessionDate;
  final int startMinutes;
  final int endMinutes;
  final double attendanceUnits;
  final String sessionStatus;
  final bool isMandatory;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LectureSession({
    required this.id,
    required this.subjectId,
    this.timetableEntryId,
    required this.sessionDate,
    required this.startMinutes,
    required this.endMinutes,
    required this.attendanceUnits,
    required this.sessionStatus,
    required this.isMandatory,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectId);
    if (!nullToAbsent || timetableEntryId != null) {
      map['timetable_entry_id'] = Variable<int>(timetableEntryId);
    }
    map['session_date'] = Variable<DateTime>(sessionDate);
    map['start_minutes'] = Variable<int>(startMinutes);
    map['end_minutes'] = Variable<int>(endMinutes);
    map['attendance_units'] = Variable<double>(attendanceUnits);
    map['session_status'] = Variable<String>(sessionStatus);
    map['is_mandatory'] = Variable<bool>(isMandatory);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LectureSessionsCompanion toCompanion(bool nullToAbsent) {
    return LectureSessionsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      timetableEntryId: timetableEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(timetableEntryId),
      sessionDate: Value(sessionDate),
      startMinutes: Value(startMinutes),
      endMinutes: Value(endMinutes),
      attendanceUnits: Value(attendanceUnits),
      sessionStatus: Value(sessionStatus),
      isMandatory: Value(isMandatory),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LectureSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LectureSession(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      timetableEntryId: serializer.fromJson<int?>(json['timetableEntryId']),
      sessionDate: serializer.fromJson<DateTime>(json['sessionDate']),
      startMinutes: serializer.fromJson<int>(json['startMinutes']),
      endMinutes: serializer.fromJson<int>(json['endMinutes']),
      attendanceUnits: serializer.fromJson<double>(json['attendanceUnits']),
      sessionStatus: serializer.fromJson<String>(json['sessionStatus']),
      isMandatory: serializer.fromJson<bool>(json['isMandatory']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'timetableEntryId': serializer.toJson<int?>(timetableEntryId),
      'sessionDate': serializer.toJson<DateTime>(sessionDate),
      'startMinutes': serializer.toJson<int>(startMinutes),
      'endMinutes': serializer.toJson<int>(endMinutes),
      'attendanceUnits': serializer.toJson<double>(attendanceUnits),
      'sessionStatus': serializer.toJson<String>(sessionStatus),
      'isMandatory': serializer.toJson<bool>(isMandatory),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LectureSession copyWith({
    int? id,
    int? subjectId,
    Value<int?> timetableEntryId = const Value.absent(),
    DateTime? sessionDate,
    int? startMinutes,
    int? endMinutes,
    double? attendanceUnits,
    String? sessionStatus,
    bool? isMandatory,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LectureSession(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    timetableEntryId: timetableEntryId.present
        ? timetableEntryId.value
        : this.timetableEntryId,
    sessionDate: sessionDate ?? this.sessionDate,
    startMinutes: startMinutes ?? this.startMinutes,
    endMinutes: endMinutes ?? this.endMinutes,
    attendanceUnits: attendanceUnits ?? this.attendanceUnits,
    sessionStatus: sessionStatus ?? this.sessionStatus,
    isMandatory: isMandatory ?? this.isMandatory,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LectureSession copyWithCompanion(LectureSessionsCompanion data) {
    return LectureSession(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      timetableEntryId: data.timetableEntryId.present
          ? data.timetableEntryId.value
          : this.timetableEntryId,
      sessionDate: data.sessionDate.present
          ? data.sessionDate.value
          : this.sessionDate,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
      attendanceUnits: data.attendanceUnits.present
          ? data.attendanceUnits.value
          : this.attendanceUnits,
      sessionStatus: data.sessionStatus.present
          ? data.sessionStatus.value
          : this.sessionStatus,
      isMandatory: data.isMandatory.present
          ? data.isMandatory.value
          : this.isMandatory,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LectureSession(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('timetableEntryId: $timetableEntryId, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('attendanceUnits: $attendanceUnits, ')
          ..write('sessionStatus: $sessionStatus, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    timetableEntryId,
    sessionDate,
    startMinutes,
    endMinutes,
    attendanceUnits,
    sessionStatus,
    isMandatory,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LectureSession &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.timetableEntryId == this.timetableEntryId &&
          other.sessionDate == this.sessionDate &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes &&
          other.attendanceUnits == this.attendanceUnits &&
          other.sessionStatus == this.sessionStatus &&
          other.isMandatory == this.isMandatory &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LectureSessionsCompanion extends UpdateCompanion<LectureSession> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<int?> timetableEntryId;
  final Value<DateTime> sessionDate;
  final Value<int> startMinutes;
  final Value<int> endMinutes;
  final Value<double> attendanceUnits;
  final Value<String> sessionStatus;
  final Value<bool> isMandatory;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LectureSessionsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.timetableEntryId = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.attendanceUnits = const Value.absent(),
    this.sessionStatus = const Value.absent(),
    this.isMandatory = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LectureSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    this.timetableEntryId = const Value.absent(),
    required DateTime sessionDate,
    required int startMinutes,
    required int endMinutes,
    this.attendanceUnits = const Value.absent(),
    required String sessionStatus,
    this.isMandatory = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : subjectId = Value(subjectId),
       sessionDate = Value(sessionDate),
       startMinutes = Value(startMinutes),
       endMinutes = Value(endMinutes),
       sessionStatus = Value(sessionStatus);
  static Insertable<LectureSession> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<int>? timetableEntryId,
    Expression<DateTime>? sessionDate,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
    Expression<double>? attendanceUnits,
    Expression<String>? sessionStatus,
    Expression<bool>? isMandatory,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (timetableEntryId != null) 'timetable_entry_id': timetableEntryId,
      if (sessionDate != null) 'session_date': sessionDate,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
      if (attendanceUnits != null) 'attendance_units': attendanceUnits,
      if (sessionStatus != null) 'session_status': sessionStatus,
      if (isMandatory != null) 'is_mandatory': isMandatory,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LectureSessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? subjectId,
    Value<int?>? timetableEntryId,
    Value<DateTime>? sessionDate,
    Value<int>? startMinutes,
    Value<int>? endMinutes,
    Value<double>? attendanceUnits,
    Value<String>? sessionStatus,
    Value<bool>? isMandatory,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LectureSessionsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      timetableEntryId: timetableEntryId ?? this.timetableEntryId,
      sessionDate: sessionDate ?? this.sessionDate,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      attendanceUnits: attendanceUnits ?? this.attendanceUnits,
      sessionStatus: sessionStatus ?? this.sessionStatus,
      isMandatory: isMandatory ?? this.isMandatory,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (timetableEntryId.present) {
      map['timetable_entry_id'] = Variable<int>(timetableEntryId.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    if (attendanceUnits.present) {
      map['attendance_units'] = Variable<double>(attendanceUnits.value);
    }
    if (sessionStatus.present) {
      map['session_status'] = Variable<String>(sessionStatus.value);
    }
    if (isMandatory.present) {
      map['is_mandatory'] = Variable<bool>(isMandatory.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LectureSessionsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('timetableEntryId: $timetableEntryId, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('attendanceUnits: $attendanceUnits, ')
          ..write('sessionStatus: $sessionStatus, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AttendanceRecordsTable extends AttendanceRecords
    with TableInfo<$AttendanceRecordsTable, AttendanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lectureSessionIdMeta = const VerificationMeta(
    'lectureSessionId',
  );
  @override
  late final GeneratedColumn<int> lectureSessionId = GeneratedColumn<int>(
    'lecture_session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lecture_sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _attendanceStatusMeta = const VerificationMeta(
    'attendanceStatus',
  );
  @override
  late final GeneratedColumn<String> attendanceStatus = GeneratedColumn<String>(
    'attendance_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countedUnitsMeta = const VerificationMeta(
    'countedUnits',
  );
  @override
  late final GeneratedColumn<double> countedUnits = GeneratedColumn<double>(
    'counted_units',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _attendedUnitsMeta = const VerificationMeta(
    'attendedUnits',
  );
  @override
  late final GeneratedColumn<double> attendedUnits = GeneratedColumn<double>(
    'attended_units',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lectureSessionId,
    subjectId,
    attendanceStatus,
    countedUnits,
    attendedUnits,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lecture_session_id')) {
      context.handle(
        _lectureSessionIdMeta,
        lectureSessionId.isAcceptableOrUnknown(
          data['lecture_session_id']!,
          _lectureSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lectureSessionIdMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('attendance_status')) {
      context.handle(
        _attendanceStatusMeta,
        attendanceStatus.isAcceptableOrUnknown(
          data['attendance_status']!,
          _attendanceStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_attendanceStatusMeta);
    }
    if (data.containsKey('counted_units')) {
      context.handle(
        _countedUnitsMeta,
        countedUnits.isAcceptableOrUnknown(
          data['counted_units']!,
          _countedUnitsMeta,
        ),
      );
    }
    if (data.containsKey('attended_units')) {
      context.handle(
        _attendedUnitsMeta,
        attendedUnits.isAcceptableOrUnknown(
          data['attended_units']!,
          _attendedUnitsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {lectureSessionId},
  ];
  @override
  AttendanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lectureSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lecture_session_id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      )!,
      attendanceStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attendance_status'],
      )!,
      countedUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}counted_units'],
      )!,
      attendedUnits: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}attended_units'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AttendanceRecordsTable createAlias(String alias) {
    return $AttendanceRecordsTable(attachedDatabase, alias);
  }
}

class AttendanceRecord extends DataClass
    implements Insertable<AttendanceRecord> {
  final int id;
  final int lectureSessionId;
  final int subjectId;
  final String attendanceStatus;
  final double countedUnits;
  final double attendedUnits;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AttendanceRecord({
    required this.id,
    required this.lectureSessionId,
    required this.subjectId,
    required this.attendanceStatus,
    required this.countedUnits,
    required this.attendedUnits,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lecture_session_id'] = Variable<int>(lectureSessionId);
    map['subject_id'] = Variable<int>(subjectId);
    map['attendance_status'] = Variable<String>(attendanceStatus);
    map['counted_units'] = Variable<double>(countedUnits);
    map['attended_units'] = Variable<double>(attendedUnits);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AttendanceRecordsCompanion toCompanion(bool nullToAbsent) {
    return AttendanceRecordsCompanion(
      id: Value(id),
      lectureSessionId: Value(lectureSessionId),
      subjectId: Value(subjectId),
      attendanceStatus: Value(attendanceStatus),
      countedUnits: Value(countedUnits),
      attendedUnits: Value(attendedUnits),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AttendanceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceRecord(
      id: serializer.fromJson<int>(json['id']),
      lectureSessionId: serializer.fromJson<int>(json['lectureSessionId']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      attendanceStatus: serializer.fromJson<String>(json['attendanceStatus']),
      countedUnits: serializer.fromJson<double>(json['countedUnits']),
      attendedUnits: serializer.fromJson<double>(json['attendedUnits']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lectureSessionId': serializer.toJson<int>(lectureSessionId),
      'subjectId': serializer.toJson<int>(subjectId),
      'attendanceStatus': serializer.toJson<String>(attendanceStatus),
      'countedUnits': serializer.toJson<double>(countedUnits),
      'attendedUnits': serializer.toJson<double>(attendedUnits),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AttendanceRecord copyWith({
    int? id,
    int? lectureSessionId,
    int? subjectId,
    String? attendanceStatus,
    double? countedUnits,
    double? attendedUnits,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AttendanceRecord(
    id: id ?? this.id,
    lectureSessionId: lectureSessionId ?? this.lectureSessionId,
    subjectId: subjectId ?? this.subjectId,
    attendanceStatus: attendanceStatus ?? this.attendanceStatus,
    countedUnits: countedUnits ?? this.countedUnits,
    attendedUnits: attendedUnits ?? this.attendedUnits,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AttendanceRecord copyWithCompanion(AttendanceRecordsCompanion data) {
    return AttendanceRecord(
      id: data.id.present ? data.id.value : this.id,
      lectureSessionId: data.lectureSessionId.present
          ? data.lectureSessionId.value
          : this.lectureSessionId,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      attendanceStatus: data.attendanceStatus.present
          ? data.attendanceStatus.value
          : this.attendanceStatus,
      countedUnits: data.countedUnits.present
          ? data.countedUnits.value
          : this.countedUnits,
      attendedUnits: data.attendedUnits.present
          ? data.attendedUnits.value
          : this.attendedUnits,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceRecord(')
          ..write('id: $id, ')
          ..write('lectureSessionId: $lectureSessionId, ')
          ..write('subjectId: $subjectId, ')
          ..write('attendanceStatus: $attendanceStatus, ')
          ..write('countedUnits: $countedUnits, ')
          ..write('attendedUnits: $attendedUnits, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lectureSessionId,
    subjectId,
    attendanceStatus,
    countedUnits,
    attendedUnits,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceRecord &&
          other.id == this.id &&
          other.lectureSessionId == this.lectureSessionId &&
          other.subjectId == this.subjectId &&
          other.attendanceStatus == this.attendanceStatus &&
          other.countedUnits == this.countedUnits &&
          other.attendedUnits == this.attendedUnits &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AttendanceRecordsCompanion extends UpdateCompanion<AttendanceRecord> {
  final Value<int> id;
  final Value<int> lectureSessionId;
  final Value<int> subjectId;
  final Value<String> attendanceStatus;
  final Value<double> countedUnits;
  final Value<double> attendedUnits;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AttendanceRecordsCompanion({
    this.id = const Value.absent(),
    this.lectureSessionId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.attendanceStatus = const Value.absent(),
    this.countedUnits = const Value.absent(),
    this.attendedUnits = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AttendanceRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int lectureSessionId,
    required int subjectId,
    required String attendanceStatus,
    this.countedUnits = const Value.absent(),
    this.attendedUnits = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : lectureSessionId = Value(lectureSessionId),
       subjectId = Value(subjectId),
       attendanceStatus = Value(attendanceStatus);
  static Insertable<AttendanceRecord> custom({
    Expression<int>? id,
    Expression<int>? lectureSessionId,
    Expression<int>? subjectId,
    Expression<String>? attendanceStatus,
    Expression<double>? countedUnits,
    Expression<double>? attendedUnits,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lectureSessionId != null) 'lecture_session_id': lectureSessionId,
      if (subjectId != null) 'subject_id': subjectId,
      if (attendanceStatus != null) 'attendance_status': attendanceStatus,
      if (countedUnits != null) 'counted_units': countedUnits,
      if (attendedUnits != null) 'attended_units': attendedUnits,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AttendanceRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? lectureSessionId,
    Value<int>? subjectId,
    Value<String>? attendanceStatus,
    Value<double>? countedUnits,
    Value<double>? attendedUnits,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return AttendanceRecordsCompanion(
      id: id ?? this.id,
      lectureSessionId: lectureSessionId ?? this.lectureSessionId,
      subjectId: subjectId ?? this.subjectId,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      countedUnits: countedUnits ?? this.countedUnits,
      attendedUnits: attendedUnits ?? this.attendedUnits,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lectureSessionId.present) {
      map['lecture_session_id'] = Variable<int>(lectureSessionId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (attendanceStatus.present) {
      map['attendance_status'] = Variable<String>(attendanceStatus.value);
    }
    if (countedUnits.present) {
      map['counted_units'] = Variable<double>(countedUnits.value);
    }
    if (attendedUnits.present) {
      map['attended_units'] = Variable<double>(attendedUnits.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('lectureSessionId: $lectureSessionId, ')
          ..write('subjectId: $subjectId, ')
          ..write('attendanceStatus: $attendanceStatus, ')
          ..write('countedUnits: $countedUnits, ')
          ..write('attendedUnits: $attendedUnits, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InternshipRequirementsTable extends InternshipRequirements
    with TableInfo<$InternshipRequirementsTable, InternshipRequirement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InternshipRequirementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentProfileIdMeta = const VerificationMeta(
    'studentProfileId',
  );
  @override
  late final GeneratedColumn<int> studentProfileId = GeneratedColumn<int>(
    'student_profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES student_profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _requiredDaysPerWeekMeta =
      const VerificationMeta('requiredDaysPerWeek');
  @override
  late final GeneratedColumn<int> requiredDaysPerWeek = GeneratedColumn<int>(
    'required_days_per_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _requiredHoursPerWeekMeta =
      const VerificationMeta('requiredHoursPerWeek');
  @override
  late final GeneratedColumn<int> requiredHoursPerWeek = GeneratedColumn<int>(
    'required_hours_per_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allowsHalfDayMeta = const VerificationMeta(
    'allowsHalfDay',
  );
  @override
  late final GeneratedColumn<bool> allowsHalfDay = GeneratedColumn<bool>(
    'allows_half_day',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("allows_half_day" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _travelMinutesMeta = const VerificationMeta(
    'travelMinutes',
  );
  @override
  late final GeneratedColumn<int> travelMinutes = GeneratedColumn<int>(
    'travel_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentProfileId,
    requiredDaysPerWeek,
    requiredHoursPerWeek,
    allowsHalfDay,
    startMinutes,
    endMinutes,
    travelMinutes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'internship_requirements';
  @override
  VerificationContext validateIntegrity(
    Insertable<InternshipRequirement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_profile_id')) {
      context.handle(
        _studentProfileIdMeta,
        studentProfileId.isAcceptableOrUnknown(
          data['student_profile_id']!,
          _studentProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studentProfileIdMeta);
    }
    if (data.containsKey('required_days_per_week')) {
      context.handle(
        _requiredDaysPerWeekMeta,
        requiredDaysPerWeek.isAcceptableOrUnknown(
          data['required_days_per_week']!,
          _requiredDaysPerWeekMeta,
        ),
      );
    }
    if (data.containsKey('required_hours_per_week')) {
      context.handle(
        _requiredHoursPerWeekMeta,
        requiredHoursPerWeek.isAcceptableOrUnknown(
          data['required_hours_per_week']!,
          _requiredHoursPerWeekMeta,
        ),
      );
    }
    if (data.containsKey('allows_half_day')) {
      context.handle(
        _allowsHalfDayMeta,
        allowsHalfDay.isAcceptableOrUnknown(
          data['allows_half_day']!,
          _allowsHalfDayMeta,
        ),
      );
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    }
    if (data.containsKey('travel_minutes')) {
      context.handle(
        _travelMinutesMeta,
        travelMinutes.isAcceptableOrUnknown(
          data['travel_minutes']!,
          _travelMinutesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InternshipRequirement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InternshipRequirement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_profile_id'],
      )!,
      requiredDaysPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}required_days_per_week'],
      )!,
      requiredHoursPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}required_hours_per_week'],
      ),
      allowsHalfDay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}allows_half_day'],
      )!,
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      ),
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      ),
      travelMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}travel_minutes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $InternshipRequirementsTable createAlias(String alias) {
    return $InternshipRequirementsTable(attachedDatabase, alias);
  }
}

class InternshipRequirement extends DataClass
    implements Insertable<InternshipRequirement> {
  final int id;
  final int studentProfileId;
  final int requiredDaysPerWeek;
  final int? requiredHoursPerWeek;
  final bool allowsHalfDay;
  final int? startMinutes;
  final int? endMinutes;
  final int travelMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InternshipRequirement({
    required this.id,
    required this.studentProfileId,
    required this.requiredDaysPerWeek,
    this.requiredHoursPerWeek,
    required this.allowsHalfDay,
    this.startMinutes,
    this.endMinutes,
    required this.travelMinutes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_profile_id'] = Variable<int>(studentProfileId);
    map['required_days_per_week'] = Variable<int>(requiredDaysPerWeek);
    if (!nullToAbsent || requiredHoursPerWeek != null) {
      map['required_hours_per_week'] = Variable<int>(requiredHoursPerWeek);
    }
    map['allows_half_day'] = Variable<bool>(allowsHalfDay);
    if (!nullToAbsent || startMinutes != null) {
      map['start_minutes'] = Variable<int>(startMinutes);
    }
    if (!nullToAbsent || endMinutes != null) {
      map['end_minutes'] = Variable<int>(endMinutes);
    }
    map['travel_minutes'] = Variable<int>(travelMinutes);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InternshipRequirementsCompanion toCompanion(bool nullToAbsent) {
    return InternshipRequirementsCompanion(
      id: Value(id),
      studentProfileId: Value(studentProfileId),
      requiredDaysPerWeek: Value(requiredDaysPerWeek),
      requiredHoursPerWeek: requiredHoursPerWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(requiredHoursPerWeek),
      allowsHalfDay: Value(allowsHalfDay),
      startMinutes: startMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(startMinutes),
      endMinutes: endMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(endMinutes),
      travelMinutes: Value(travelMinutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InternshipRequirement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InternshipRequirement(
      id: serializer.fromJson<int>(json['id']),
      studentProfileId: serializer.fromJson<int>(json['studentProfileId']),
      requiredDaysPerWeek: serializer.fromJson<int>(
        json['requiredDaysPerWeek'],
      ),
      requiredHoursPerWeek: serializer.fromJson<int?>(
        json['requiredHoursPerWeek'],
      ),
      allowsHalfDay: serializer.fromJson<bool>(json['allowsHalfDay']),
      startMinutes: serializer.fromJson<int?>(json['startMinutes']),
      endMinutes: serializer.fromJson<int?>(json['endMinutes']),
      travelMinutes: serializer.fromJson<int>(json['travelMinutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentProfileId': serializer.toJson<int>(studentProfileId),
      'requiredDaysPerWeek': serializer.toJson<int>(requiredDaysPerWeek),
      'requiredHoursPerWeek': serializer.toJson<int?>(requiredHoursPerWeek),
      'allowsHalfDay': serializer.toJson<bool>(allowsHalfDay),
      'startMinutes': serializer.toJson<int?>(startMinutes),
      'endMinutes': serializer.toJson<int?>(endMinutes),
      'travelMinutes': serializer.toJson<int>(travelMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InternshipRequirement copyWith({
    int? id,
    int? studentProfileId,
    int? requiredDaysPerWeek,
    Value<int?> requiredHoursPerWeek = const Value.absent(),
    bool? allowsHalfDay,
    Value<int?> startMinutes = const Value.absent(),
    Value<int?> endMinutes = const Value.absent(),
    int? travelMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => InternshipRequirement(
    id: id ?? this.id,
    studentProfileId: studentProfileId ?? this.studentProfileId,
    requiredDaysPerWeek: requiredDaysPerWeek ?? this.requiredDaysPerWeek,
    requiredHoursPerWeek: requiredHoursPerWeek.present
        ? requiredHoursPerWeek.value
        : this.requiredHoursPerWeek,
    allowsHalfDay: allowsHalfDay ?? this.allowsHalfDay,
    startMinutes: startMinutes.present ? startMinutes.value : this.startMinutes,
    endMinutes: endMinutes.present ? endMinutes.value : this.endMinutes,
    travelMinutes: travelMinutes ?? this.travelMinutes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  InternshipRequirement copyWithCompanion(
    InternshipRequirementsCompanion data,
  ) {
    return InternshipRequirement(
      id: data.id.present ? data.id.value : this.id,
      studentProfileId: data.studentProfileId.present
          ? data.studentProfileId.value
          : this.studentProfileId,
      requiredDaysPerWeek: data.requiredDaysPerWeek.present
          ? data.requiredDaysPerWeek.value
          : this.requiredDaysPerWeek,
      requiredHoursPerWeek: data.requiredHoursPerWeek.present
          ? data.requiredHoursPerWeek.value
          : this.requiredHoursPerWeek,
      allowsHalfDay: data.allowsHalfDay.present
          ? data.allowsHalfDay.value
          : this.allowsHalfDay,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
      travelMinutes: data.travelMinutes.present
          ? data.travelMinutes.value
          : this.travelMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InternshipRequirement(')
          ..write('id: $id, ')
          ..write('studentProfileId: $studentProfileId, ')
          ..write('requiredDaysPerWeek: $requiredDaysPerWeek, ')
          ..write('requiredHoursPerWeek: $requiredHoursPerWeek, ')
          ..write('allowsHalfDay: $allowsHalfDay, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('travelMinutes: $travelMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentProfileId,
    requiredDaysPerWeek,
    requiredHoursPerWeek,
    allowsHalfDay,
    startMinutes,
    endMinutes,
    travelMinutes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InternshipRequirement &&
          other.id == this.id &&
          other.studentProfileId == this.studentProfileId &&
          other.requiredDaysPerWeek == this.requiredDaysPerWeek &&
          other.requiredHoursPerWeek == this.requiredHoursPerWeek &&
          other.allowsHalfDay == this.allowsHalfDay &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes &&
          other.travelMinutes == this.travelMinutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InternshipRequirementsCompanion
    extends UpdateCompanion<InternshipRequirement> {
  final Value<int> id;
  final Value<int> studentProfileId;
  final Value<int> requiredDaysPerWeek;
  final Value<int?> requiredHoursPerWeek;
  final Value<bool> allowsHalfDay;
  final Value<int?> startMinutes;
  final Value<int?> endMinutes;
  final Value<int> travelMinutes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InternshipRequirementsCompanion({
    this.id = const Value.absent(),
    this.studentProfileId = const Value.absent(),
    this.requiredDaysPerWeek = const Value.absent(),
    this.requiredHoursPerWeek = const Value.absent(),
    this.allowsHalfDay = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.travelMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InternshipRequirementsCompanion.insert({
    this.id = const Value.absent(),
    required int studentProfileId,
    this.requiredDaysPerWeek = const Value.absent(),
    this.requiredHoursPerWeek = const Value.absent(),
    this.allowsHalfDay = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.travelMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : studentProfileId = Value(studentProfileId);
  static Insertable<InternshipRequirement> custom({
    Expression<int>? id,
    Expression<int>? studentProfileId,
    Expression<int>? requiredDaysPerWeek,
    Expression<int>? requiredHoursPerWeek,
    Expression<bool>? allowsHalfDay,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
    Expression<int>? travelMinutes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentProfileId != null) 'student_profile_id': studentProfileId,
      if (requiredDaysPerWeek != null)
        'required_days_per_week': requiredDaysPerWeek,
      if (requiredHoursPerWeek != null)
        'required_hours_per_week': requiredHoursPerWeek,
      if (allowsHalfDay != null) 'allows_half_day': allowsHalfDay,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
      if (travelMinutes != null) 'travel_minutes': travelMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InternshipRequirementsCompanion copyWith({
    Value<int>? id,
    Value<int>? studentProfileId,
    Value<int>? requiredDaysPerWeek,
    Value<int?>? requiredHoursPerWeek,
    Value<bool>? allowsHalfDay,
    Value<int?>? startMinutes,
    Value<int?>? endMinutes,
    Value<int>? travelMinutes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return InternshipRequirementsCompanion(
      id: id ?? this.id,
      studentProfileId: studentProfileId ?? this.studentProfileId,
      requiredDaysPerWeek: requiredDaysPerWeek ?? this.requiredDaysPerWeek,
      requiredHoursPerWeek: requiredHoursPerWeek ?? this.requiredHoursPerWeek,
      allowsHalfDay: allowsHalfDay ?? this.allowsHalfDay,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      travelMinutes: travelMinutes ?? this.travelMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentProfileId.present) {
      map['student_profile_id'] = Variable<int>(studentProfileId.value);
    }
    if (requiredDaysPerWeek.present) {
      map['required_days_per_week'] = Variable<int>(requiredDaysPerWeek.value);
    }
    if (requiredHoursPerWeek.present) {
      map['required_hours_per_week'] = Variable<int>(
        requiredHoursPerWeek.value,
      );
    }
    if (allowsHalfDay.present) {
      map['allows_half_day'] = Variable<bool>(allowsHalfDay.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    if (travelMinutes.present) {
      map['travel_minutes'] = Variable<int>(travelMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InternshipRequirementsCompanion(')
          ..write('id: $id, ')
          ..write('studentProfileId: $studentProfileId, ')
          ..write('requiredDaysPerWeek: $requiredDaysPerWeek, ')
          ..write('requiredHoursPerWeek: $requiredHoursPerWeek, ')
          ..write('allowsHalfDay: $allowsHalfDay, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('travelMinutes: $travelMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InternshipAvailabilityTable extends InternshipAvailability
    with TableInfo<$InternshipAvailabilityTable, InternshipAvailabilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InternshipAvailabilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _internshipRequirementIdMeta =
      const VerificationMeta('internshipRequirementId');
  @override
  late final GeneratedColumn<int> internshipRequirementId =
      GeneratedColumn<int>(
        'internship_requirement_id',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES internship_requirements (id) ON DELETE CASCADE',
        ),
      );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAvailableMeta = const VerificationMeta(
    'isAvailable',
  );
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
    'is_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isFixedMeta = const VerificationMeta(
    'isFixed',
  );
  @override
  late final GeneratedColumn<bool> isFixed = GeneratedColumn<bool>(
    'is_fixed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_fixed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _availabilityTypeMeta = const VerificationMeta(
    'availabilityType',
  );
  @override
  late final GeneratedColumn<String> availabilityType = GeneratedColumn<String>(
    'availability_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    internshipRequirementId,
    weekday,
    isAvailable,
    isFixed,
    availabilityType,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'internship_availability';
  @override
  VerificationContext validateIntegrity(
    Insertable<InternshipAvailabilityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('internship_requirement_id')) {
      context.handle(
        _internshipRequirementIdMeta,
        internshipRequirementId.isAcceptableOrUnknown(
          data['internship_requirement_id']!,
          _internshipRequirementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_internshipRequirementIdMeta);
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    } else if (isInserting) {
      context.missing(_weekdayMeta);
    }
    if (data.containsKey('is_available')) {
      context.handle(
        _isAvailableMeta,
        isAvailable.isAcceptableOrUnknown(
          data['is_available']!,
          _isAvailableMeta,
        ),
      );
    }
    if (data.containsKey('is_fixed')) {
      context.handle(
        _isFixedMeta,
        isFixed.isAcceptableOrUnknown(data['is_fixed']!, _isFixedMeta),
      );
    }
    if (data.containsKey('availability_type')) {
      context.handle(
        _availabilityTypeMeta,
        availabilityType.isAcceptableOrUnknown(
          data['availability_type']!,
          _availabilityTypeMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InternshipAvailabilityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InternshipAvailabilityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      internshipRequirementId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}internship_requirement_id'],
      )!,
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      )!,
      isAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_available'],
      )!,
      isFixed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_fixed'],
      )!,
      availabilityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}availability_type'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $InternshipAvailabilityTable createAlias(String alias) {
    return $InternshipAvailabilityTable(attachedDatabase, alias);
  }
}

class InternshipAvailabilityData extends DataClass
    implements Insertable<InternshipAvailabilityData> {
  final int id;
  final int internshipRequirementId;
  final int weekday;
  final bool isAvailable;
  final bool isFixed;
  final String? availabilityType;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InternshipAvailabilityData({
    required this.id,
    required this.internshipRequirementId,
    required this.weekday,
    required this.isAvailable,
    required this.isFixed,
    this.availabilityType,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['internship_requirement_id'] = Variable<int>(internshipRequirementId);
    map['weekday'] = Variable<int>(weekday);
    map['is_available'] = Variable<bool>(isAvailable);
    map['is_fixed'] = Variable<bool>(isFixed);
    if (!nullToAbsent || availabilityType != null) {
      map['availability_type'] = Variable<String>(availabilityType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InternshipAvailabilityCompanion toCompanion(bool nullToAbsent) {
    return InternshipAvailabilityCompanion(
      id: Value(id),
      internshipRequirementId: Value(internshipRequirementId),
      weekday: Value(weekday),
      isAvailable: Value(isAvailable),
      isFixed: Value(isFixed),
      availabilityType: availabilityType == null && nullToAbsent
          ? const Value.absent()
          : Value(availabilityType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InternshipAvailabilityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InternshipAvailabilityData(
      id: serializer.fromJson<int>(json['id']),
      internshipRequirementId: serializer.fromJson<int>(
        json['internshipRequirementId'],
      ),
      weekday: serializer.fromJson<int>(json['weekday']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      isFixed: serializer.fromJson<bool>(json['isFixed']),
      availabilityType: serializer.fromJson<String?>(json['availabilityType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'internshipRequirementId': serializer.toJson<int>(
        internshipRequirementId,
      ),
      'weekday': serializer.toJson<int>(weekday),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'isFixed': serializer.toJson<bool>(isFixed),
      'availabilityType': serializer.toJson<String?>(availabilityType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InternshipAvailabilityData copyWith({
    int? id,
    int? internshipRequirementId,
    int? weekday,
    bool? isAvailable,
    bool? isFixed,
    Value<String?> availabilityType = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => InternshipAvailabilityData(
    id: id ?? this.id,
    internshipRequirementId:
        internshipRequirementId ?? this.internshipRequirementId,
    weekday: weekday ?? this.weekday,
    isAvailable: isAvailable ?? this.isAvailable,
    isFixed: isFixed ?? this.isFixed,
    availabilityType: availabilityType.present
        ? availabilityType.value
        : this.availabilityType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  InternshipAvailabilityData copyWithCompanion(
    InternshipAvailabilityCompanion data,
  ) {
    return InternshipAvailabilityData(
      id: data.id.present ? data.id.value : this.id,
      internshipRequirementId: data.internshipRequirementId.present
          ? data.internshipRequirementId.value
          : this.internshipRequirementId,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      isAvailable: data.isAvailable.present
          ? data.isAvailable.value
          : this.isAvailable,
      isFixed: data.isFixed.present ? data.isFixed.value : this.isFixed,
      availabilityType: data.availabilityType.present
          ? data.availabilityType.value
          : this.availabilityType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InternshipAvailabilityData(')
          ..write('id: $id, ')
          ..write('internshipRequirementId: $internshipRequirementId, ')
          ..write('weekday: $weekday, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('isFixed: $isFixed, ')
          ..write('availabilityType: $availabilityType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    internshipRequirementId,
    weekday,
    isAvailable,
    isFixed,
    availabilityType,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InternshipAvailabilityData &&
          other.id == this.id &&
          other.internshipRequirementId == this.internshipRequirementId &&
          other.weekday == this.weekday &&
          other.isAvailable == this.isAvailable &&
          other.isFixed == this.isFixed &&
          other.availabilityType == this.availabilityType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InternshipAvailabilityCompanion
    extends UpdateCompanion<InternshipAvailabilityData> {
  final Value<int> id;
  final Value<int> internshipRequirementId;
  final Value<int> weekday;
  final Value<bool> isAvailable;
  final Value<bool> isFixed;
  final Value<String?> availabilityType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InternshipAvailabilityCompanion({
    this.id = const Value.absent(),
    this.internshipRequirementId = const Value.absent(),
    this.weekday = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.isFixed = const Value.absent(),
    this.availabilityType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InternshipAvailabilityCompanion.insert({
    this.id = const Value.absent(),
    required int internshipRequirementId,
    required int weekday,
    this.isAvailable = const Value.absent(),
    this.isFixed = const Value.absent(),
    this.availabilityType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : internshipRequirementId = Value(internshipRequirementId),
       weekday = Value(weekday);
  static Insertable<InternshipAvailabilityData> custom({
    Expression<int>? id,
    Expression<int>? internshipRequirementId,
    Expression<int>? weekday,
    Expression<bool>? isAvailable,
    Expression<bool>? isFixed,
    Expression<String>? availabilityType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (internshipRequirementId != null)
        'internship_requirement_id': internshipRequirementId,
      if (weekday != null) 'weekday': weekday,
      if (isAvailable != null) 'is_available': isAvailable,
      if (isFixed != null) 'is_fixed': isFixed,
      if (availabilityType != null) 'availability_type': availabilityType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InternshipAvailabilityCompanion copyWith({
    Value<int>? id,
    Value<int>? internshipRequirementId,
    Value<int>? weekday,
    Value<bool>? isAvailable,
    Value<bool>? isFixed,
    Value<String?>? availabilityType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return InternshipAvailabilityCompanion(
      id: id ?? this.id,
      internshipRequirementId:
          internshipRequirementId ?? this.internshipRequirementId,
      weekday: weekday ?? this.weekday,
      isAvailable: isAvailable ?? this.isAvailable,
      isFixed: isFixed ?? this.isFixed,
      availabilityType: availabilityType ?? this.availabilityType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (internshipRequirementId.present) {
      map['internship_requirement_id'] = Variable<int>(
        internshipRequirementId.value,
      );
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (isFixed.present) {
      map['is_fixed'] = Variable<bool>(isFixed.value);
    }
    if (availabilityType.present) {
      map['availability_type'] = Variable<String>(availabilityType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InternshipAvailabilityCompanion(')
          ..write('id: $id, ')
          ..write('internshipRequirementId: $internshipRequirementId, ')
          ..write('weekday: $weekday, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('isFixed: $isFixed, ')
          ..write('availabilityType: $availabilityType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InternshipSessionsTable extends InternshipSessions
    with TableInfo<$InternshipSessionsTable, InternshipSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InternshipSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionDateMeta = const VerificationMeta(
    'sessionDate',
  );
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
    'session_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionTypeMeta = const VerificationMeta(
    'sessionType',
  );
  @override
  late final GeneratedColumn<String> sessionType = GeneratedColumn<String>(
    'session_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMinutesMeta = const VerificationMeta(
    'completedMinutes',
  );
  @override
  late final GeneratedColumn<int> completedMinutes = GeneratedColumn<int>(
    'completed_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionDate,
    startMinutes,
    endMinutes,
    sessionType,
    status,
    completedMinutes,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'internship_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<InternshipSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_date')) {
      context.handle(
        _sessionDateMeta,
        sessionDate.isAcceptableOrUnknown(
          data['session_date']!,
          _sessionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionDateMeta);
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinutesMeta);
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinutesMeta);
    }
    if (data.containsKey('session_type')) {
      context.handle(
        _sessionTypeMeta,
        sessionType.isAcceptableOrUnknown(
          data['session_type']!,
          _sessionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('completed_minutes')) {
      context.handle(
        _completedMinutesMeta,
        completedMinutes.isAcceptableOrUnknown(
          data['completed_minutes']!,
          _completedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InternshipSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InternshipSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}session_date'],
      )!,
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      )!,
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      )!,
      sessionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      completedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_minutes'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $InternshipSessionsTable createAlias(String alias) {
    return $InternshipSessionsTable(attachedDatabase, alias);
  }
}

class InternshipSession extends DataClass
    implements Insertable<InternshipSession> {
  final int id;
  final DateTime sessionDate;
  final int startMinutes;
  final int endMinutes;
  final String sessionType;
  final String status;
  final int completedMinutes;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InternshipSession({
    required this.id,
    required this.sessionDate,
    required this.startMinutes,
    required this.endMinutes,
    required this.sessionType,
    required this.status,
    required this.completedMinutes,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_date'] = Variable<DateTime>(sessionDate);
    map['start_minutes'] = Variable<int>(startMinutes);
    map['end_minutes'] = Variable<int>(endMinutes);
    map['session_type'] = Variable<String>(sessionType);
    map['status'] = Variable<String>(status);
    map['completed_minutes'] = Variable<int>(completedMinutes);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InternshipSessionsCompanion toCompanion(bool nullToAbsent) {
    return InternshipSessionsCompanion(
      id: Value(id),
      sessionDate: Value(sessionDate),
      startMinutes: Value(startMinutes),
      endMinutes: Value(endMinutes),
      sessionType: Value(sessionType),
      status: Value(status),
      completedMinutes: Value(completedMinutes),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InternshipSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InternshipSession(
      id: serializer.fromJson<int>(json['id']),
      sessionDate: serializer.fromJson<DateTime>(json['sessionDate']),
      startMinutes: serializer.fromJson<int>(json['startMinutes']),
      endMinutes: serializer.fromJson<int>(json['endMinutes']),
      sessionType: serializer.fromJson<String>(json['sessionType']),
      status: serializer.fromJson<String>(json['status']),
      completedMinutes: serializer.fromJson<int>(json['completedMinutes']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionDate': serializer.toJson<DateTime>(sessionDate),
      'startMinutes': serializer.toJson<int>(startMinutes),
      'endMinutes': serializer.toJson<int>(endMinutes),
      'sessionType': serializer.toJson<String>(sessionType),
      'status': serializer.toJson<String>(status),
      'completedMinutes': serializer.toJson<int>(completedMinutes),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InternshipSession copyWith({
    int? id,
    DateTime? sessionDate,
    int? startMinutes,
    int? endMinutes,
    String? sessionType,
    String? status,
    int? completedMinutes,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => InternshipSession(
    id: id ?? this.id,
    sessionDate: sessionDate ?? this.sessionDate,
    startMinutes: startMinutes ?? this.startMinutes,
    endMinutes: endMinutes ?? this.endMinutes,
    sessionType: sessionType ?? this.sessionType,
    status: status ?? this.status,
    completedMinutes: completedMinutes ?? this.completedMinutes,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  InternshipSession copyWithCompanion(InternshipSessionsCompanion data) {
    return InternshipSession(
      id: data.id.present ? data.id.value : this.id,
      sessionDate: data.sessionDate.present
          ? data.sessionDate.value
          : this.sessionDate,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
      sessionType: data.sessionType.present
          ? data.sessionType.value
          : this.sessionType,
      status: data.status.present ? data.status.value : this.status,
      completedMinutes: data.completedMinutes.present
          ? data.completedMinutes.value
          : this.completedMinutes,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InternshipSession(')
          ..write('id: $id, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('sessionType: $sessionType, ')
          ..write('status: $status, ')
          ..write('completedMinutes: $completedMinutes, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionDate,
    startMinutes,
    endMinutes,
    sessionType,
    status,
    completedMinutes,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InternshipSession &&
          other.id == this.id &&
          other.sessionDate == this.sessionDate &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes &&
          other.sessionType == this.sessionType &&
          other.status == this.status &&
          other.completedMinutes == this.completedMinutes &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InternshipSessionsCompanion extends UpdateCompanion<InternshipSession> {
  final Value<int> id;
  final Value<DateTime> sessionDate;
  final Value<int> startMinutes;
  final Value<int> endMinutes;
  final Value<String> sessionType;
  final Value<String> status;
  final Value<int> completedMinutes;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InternshipSessionsCompanion({
    this.id = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
    this.sessionType = const Value.absent(),
    this.status = const Value.absent(),
    this.completedMinutes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InternshipSessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime sessionDate,
    required int startMinutes,
    required int endMinutes,
    required String sessionType,
    required String status,
    this.completedMinutes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : sessionDate = Value(sessionDate),
       startMinutes = Value(startMinutes),
       endMinutes = Value(endMinutes),
       sessionType = Value(sessionType),
       status = Value(status);
  static Insertable<InternshipSession> custom({
    Expression<int>? id,
    Expression<DateTime>? sessionDate,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
    Expression<String>? sessionType,
    Expression<String>? status,
    Expression<int>? completedMinutes,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionDate != null) 'session_date': sessionDate,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
      if (sessionType != null) 'session_type': sessionType,
      if (status != null) 'status': status,
      if (completedMinutes != null) 'completed_minutes': completedMinutes,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InternshipSessionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? sessionDate,
    Value<int>? startMinutes,
    Value<int>? endMinutes,
    Value<String>? sessionType,
    Value<String>? status,
    Value<int>? completedMinutes,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return InternshipSessionsCompanion(
      id: id ?? this.id,
      sessionDate: sessionDate ?? this.sessionDate,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      sessionType: sessionType ?? this.sessionType,
      status: status ?? this.status,
      completedMinutes: completedMinutes ?? this.completedMinutes,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    if (sessionType.present) {
      map['session_type'] = Variable<String>(sessionType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (completedMinutes.present) {
      map['completed_minutes'] = Variable<int>(completedMinutes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InternshipSessionsCompanion(')
          ..write('id: $id, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes, ')
          ..write('sessionType: $sessionType, ')
          ..write('status: $status, ')
          ..write('completedMinutes: $completedMinutes, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WeeklyPlansTable extends WeeklyPlans
    with TableInfo<$WeeklyPlansTable, WeeklyPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weekStartDateMeta = const VerificationMeta(
    'weekStartDate',
  );
  @override
  late final GeneratedColumn<DateTime> weekStartDate =
      GeneratedColumn<DateTime>(
        'week_start_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _planTypeMeta = const VerificationMeta(
    'planType',
  );
  @override
  late final GeneratedColumn<String> planType = GeneratedColumn<String>(
    'plan_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _riskScoreMeta = const VerificationMeta(
    'riskScore',
  );
  @override
  late final GeneratedColumn<double> riskScore = GeneratedColumn<double>(
    'risk_score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSelectedMeta = const VerificationMeta(
    'isSelected',
  );
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
    'is_selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_selected" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isValidMeta = const VerificationMeta(
    'isValid',
  );
  @override
  late final GeneratedColumn<bool> isValid = GeneratedColumn<bool>(
    'is_valid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_valid" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weekStartDate,
    planType,
    riskScore,
    isSelected,
    isValid,
    explanation,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeeklyPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('week_start_date')) {
      context.handle(
        _weekStartDateMeta,
        weekStartDate.isAcceptableOrUnknown(
          data['week_start_date']!,
          _weekStartDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weekStartDateMeta);
    }
    if (data.containsKey('plan_type')) {
      context.handle(
        _planTypeMeta,
        planType.isAcceptableOrUnknown(data['plan_type']!, _planTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_planTypeMeta);
    }
    if (data.containsKey('risk_score')) {
      context.handle(
        _riskScoreMeta,
        riskScore.isAcceptableOrUnknown(data['risk_score']!, _riskScoreMeta),
      );
    }
    if (data.containsKey('is_selected')) {
      context.handle(
        _isSelectedMeta,
        isSelected.isAcceptableOrUnknown(data['is_selected']!, _isSelectedMeta),
      );
    }
    if (data.containsKey('is_valid')) {
      context.handle(
        _isValidMeta,
        isValid.isAcceptableOrUnknown(data['is_valid']!, _isValidMeta),
      );
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeeklyPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weekStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}week_start_date'],
      )!,
      planType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_type'],
      )!,
      riskScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}risk_score'],
      ),
      isSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_selected'],
      )!,
      isValid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_valid'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WeeklyPlansTable createAlias(String alias) {
    return $WeeklyPlansTable(attachedDatabase, alias);
  }
}

class WeeklyPlan extends DataClass implements Insertable<WeeklyPlan> {
  final int id;
  final DateTime weekStartDate;
  final String planType;
  final double? riskScore;
  final bool isSelected;
  final bool isValid;
  final String? explanation;
  final DateTime createdAt;
  final DateTime updatedAt;
  const WeeklyPlan({
    required this.id,
    required this.weekStartDate,
    required this.planType,
    this.riskScore,
    required this.isSelected,
    required this.isValid,
    this.explanation,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['week_start_date'] = Variable<DateTime>(weekStartDate);
    map['plan_type'] = Variable<String>(planType);
    if (!nullToAbsent || riskScore != null) {
      map['risk_score'] = Variable<double>(riskScore);
    }
    map['is_selected'] = Variable<bool>(isSelected);
    map['is_valid'] = Variable<bool>(isValid);
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WeeklyPlansCompanion toCompanion(bool nullToAbsent) {
    return WeeklyPlansCompanion(
      id: Value(id),
      weekStartDate: Value(weekStartDate),
      planType: Value(planType),
      riskScore: riskScore == null && nullToAbsent
          ? const Value.absent()
          : Value(riskScore),
      isSelected: Value(isSelected),
      isValid: Value(isValid),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory WeeklyPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyPlan(
      id: serializer.fromJson<int>(json['id']),
      weekStartDate: serializer.fromJson<DateTime>(json['weekStartDate']),
      planType: serializer.fromJson<String>(json['planType']),
      riskScore: serializer.fromJson<double?>(json['riskScore']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
      isValid: serializer.fromJson<bool>(json['isValid']),
      explanation: serializer.fromJson<String?>(json['explanation']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weekStartDate': serializer.toJson<DateTime>(weekStartDate),
      'planType': serializer.toJson<String>(planType),
      'riskScore': serializer.toJson<double?>(riskScore),
      'isSelected': serializer.toJson<bool>(isSelected),
      'isValid': serializer.toJson<bool>(isValid),
      'explanation': serializer.toJson<String?>(explanation),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  WeeklyPlan copyWith({
    int? id,
    DateTime? weekStartDate,
    String? planType,
    Value<double?> riskScore = const Value.absent(),
    bool? isSelected,
    bool? isValid,
    Value<String?> explanation = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => WeeklyPlan(
    id: id ?? this.id,
    weekStartDate: weekStartDate ?? this.weekStartDate,
    planType: planType ?? this.planType,
    riskScore: riskScore.present ? riskScore.value : this.riskScore,
    isSelected: isSelected ?? this.isSelected,
    isValid: isValid ?? this.isValid,
    explanation: explanation.present ? explanation.value : this.explanation,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WeeklyPlan copyWithCompanion(WeeklyPlansCompanion data) {
    return WeeklyPlan(
      id: data.id.present ? data.id.value : this.id,
      weekStartDate: data.weekStartDate.present
          ? data.weekStartDate.value
          : this.weekStartDate,
      planType: data.planType.present ? data.planType.value : this.planType,
      riskScore: data.riskScore.present ? data.riskScore.value : this.riskScore,
      isSelected: data.isSelected.present
          ? data.isSelected.value
          : this.isSelected,
      isValid: data.isValid.present ? data.isValid.value : this.isValid,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyPlan(')
          ..write('id: $id, ')
          ..write('weekStartDate: $weekStartDate, ')
          ..write('planType: $planType, ')
          ..write('riskScore: $riskScore, ')
          ..write('isSelected: $isSelected, ')
          ..write('isValid: $isValid, ')
          ..write('explanation: $explanation, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weekStartDate,
    planType,
    riskScore,
    isSelected,
    isValid,
    explanation,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyPlan &&
          other.id == this.id &&
          other.weekStartDate == this.weekStartDate &&
          other.planType == this.planType &&
          other.riskScore == this.riskScore &&
          other.isSelected == this.isSelected &&
          other.isValid == this.isValid &&
          other.explanation == this.explanation &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WeeklyPlansCompanion extends UpdateCompanion<WeeklyPlan> {
  final Value<int> id;
  final Value<DateTime> weekStartDate;
  final Value<String> planType;
  final Value<double?> riskScore;
  final Value<bool> isSelected;
  final Value<bool> isValid;
  final Value<String?> explanation;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const WeeklyPlansCompanion({
    this.id = const Value.absent(),
    this.weekStartDate = const Value.absent(),
    this.planType = const Value.absent(),
    this.riskScore = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.isValid = const Value.absent(),
    this.explanation = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WeeklyPlansCompanion.insert({
    this.id = const Value.absent(),
    required DateTime weekStartDate,
    required String planType,
    this.riskScore = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.isValid = const Value.absent(),
    this.explanation = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weekStartDate = Value(weekStartDate),
       planType = Value(planType);
  static Insertable<WeeklyPlan> custom({
    Expression<int>? id,
    Expression<DateTime>? weekStartDate,
    Expression<String>? planType,
    Expression<double>? riskScore,
    Expression<bool>? isSelected,
    Expression<bool>? isValid,
    Expression<String>? explanation,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekStartDate != null) 'week_start_date': weekStartDate,
      if (planType != null) 'plan_type': planType,
      if (riskScore != null) 'risk_score': riskScore,
      if (isSelected != null) 'is_selected': isSelected,
      if (isValid != null) 'is_valid': isValid,
      if (explanation != null) 'explanation': explanation,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WeeklyPlansCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? weekStartDate,
    Value<String>? planType,
    Value<double?>? riskScore,
    Value<bool>? isSelected,
    Value<bool>? isValid,
    Value<String?>? explanation,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return WeeklyPlansCompanion(
      id: id ?? this.id,
      weekStartDate: weekStartDate ?? this.weekStartDate,
      planType: planType ?? this.planType,
      riskScore: riskScore ?? this.riskScore,
      isSelected: isSelected ?? this.isSelected,
      isValid: isValid ?? this.isValid,
      explanation: explanation ?? this.explanation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weekStartDate.present) {
      map['week_start_date'] = Variable<DateTime>(weekStartDate.value);
    }
    if (planType.present) {
      map['plan_type'] = Variable<String>(planType.value);
    }
    if (riskScore.present) {
      map['risk_score'] = Variable<double>(riskScore.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    if (isValid.present) {
      map['is_valid'] = Variable<bool>(isValid.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyPlansCompanion(')
          ..write('id: $id, ')
          ..write('weekStartDate: $weekStartDate, ')
          ..write('planType: $planType, ')
          ..write('riskScore: $riskScore, ')
          ..write('isSelected: $isSelected, ')
          ..write('isValid: $isValid, ')
          ..write('explanation: $explanation, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WeeklyPlanDaysTable extends WeeklyPlanDays
    with TableInfo<$WeeklyPlanDaysTable, WeeklyPlanDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyPlanDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weeklyPlanIdMeta = const VerificationMeta(
    'weeklyPlanId',
  );
  @override
  late final GeneratedColumn<int> weeklyPlanId = GeneratedColumn<int>(
    'weekly_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weekly_plans (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayTypeMeta = const VerificationMeta(
    'dayType',
  );
  @override
  late final GeneratedColumn<String> dayType = GeneratedColumn<String>(
    'day_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warningMeta = const VerificationMeta(
    'warning',
  );
  @override
  late final GeneratedColumn<String> warning = GeneratedColumn<String>(
    'warning',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weeklyPlanId,
    date,
    dayType,
    warning,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_plan_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeeklyPlanDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('weekly_plan_id')) {
      context.handle(
        _weeklyPlanIdMeta,
        weeklyPlanId.isAcceptableOrUnknown(
          data['weekly_plan_id']!,
          _weeklyPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weeklyPlanIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('day_type')) {
      context.handle(
        _dayTypeMeta,
        dayType.isAcceptableOrUnknown(data['day_type']!, _dayTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTypeMeta);
    }
    if (data.containsKey('warning')) {
      context.handle(
        _warningMeta,
        warning.isAcceptableOrUnknown(data['warning']!, _warningMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {weeklyPlanId, date},
  ];
  @override
  WeeklyPlanDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyPlanDay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weeklyPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekly_plan_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      dayType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_type'],
      )!,
      warning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warning'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WeeklyPlanDaysTable createAlias(String alias) {
    return $WeeklyPlanDaysTable(attachedDatabase, alias);
  }
}

class WeeklyPlanDay extends DataClass implements Insertable<WeeklyPlanDay> {
  final int id;
  final int weeklyPlanId;
  final DateTime date;
  final String dayType;
  final String? warning;
  final DateTime createdAt;
  final DateTime updatedAt;
  const WeeklyPlanDay({
    required this.id,
    required this.weeklyPlanId,
    required this.date,
    required this.dayType,
    this.warning,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weekly_plan_id'] = Variable<int>(weeklyPlanId);
    map['date'] = Variable<DateTime>(date);
    map['day_type'] = Variable<String>(dayType);
    if (!nullToAbsent || warning != null) {
      map['warning'] = Variable<String>(warning);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WeeklyPlanDaysCompanion toCompanion(bool nullToAbsent) {
    return WeeklyPlanDaysCompanion(
      id: Value(id),
      weeklyPlanId: Value(weeklyPlanId),
      date: Value(date),
      dayType: Value(dayType),
      warning: warning == null && nullToAbsent
          ? const Value.absent()
          : Value(warning),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory WeeklyPlanDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyPlanDay(
      id: serializer.fromJson<int>(json['id']),
      weeklyPlanId: serializer.fromJson<int>(json['weeklyPlanId']),
      date: serializer.fromJson<DateTime>(json['date']),
      dayType: serializer.fromJson<String>(json['dayType']),
      warning: serializer.fromJson<String?>(json['warning']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weeklyPlanId': serializer.toJson<int>(weeklyPlanId),
      'date': serializer.toJson<DateTime>(date),
      'dayType': serializer.toJson<String>(dayType),
      'warning': serializer.toJson<String?>(warning),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  WeeklyPlanDay copyWith({
    int? id,
    int? weeklyPlanId,
    DateTime? date,
    String? dayType,
    Value<String?> warning = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => WeeklyPlanDay(
    id: id ?? this.id,
    weeklyPlanId: weeklyPlanId ?? this.weeklyPlanId,
    date: date ?? this.date,
    dayType: dayType ?? this.dayType,
    warning: warning.present ? warning.value : this.warning,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WeeklyPlanDay copyWithCompanion(WeeklyPlanDaysCompanion data) {
    return WeeklyPlanDay(
      id: data.id.present ? data.id.value : this.id,
      weeklyPlanId: data.weeklyPlanId.present
          ? data.weeklyPlanId.value
          : this.weeklyPlanId,
      date: data.date.present ? data.date.value : this.date,
      dayType: data.dayType.present ? data.dayType.value : this.dayType,
      warning: data.warning.present ? data.warning.value : this.warning,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyPlanDay(')
          ..write('id: $id, ')
          ..write('weeklyPlanId: $weeklyPlanId, ')
          ..write('date: $date, ')
          ..write('dayType: $dayType, ')
          ..write('warning: $warning, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weeklyPlanId,
    date,
    dayType,
    warning,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyPlanDay &&
          other.id == this.id &&
          other.weeklyPlanId == this.weeklyPlanId &&
          other.date == this.date &&
          other.dayType == this.dayType &&
          other.warning == this.warning &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WeeklyPlanDaysCompanion extends UpdateCompanion<WeeklyPlanDay> {
  final Value<int> id;
  final Value<int> weeklyPlanId;
  final Value<DateTime> date;
  final Value<String> dayType;
  final Value<String?> warning;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const WeeklyPlanDaysCompanion({
    this.id = const Value.absent(),
    this.weeklyPlanId = const Value.absent(),
    this.date = const Value.absent(),
    this.dayType = const Value.absent(),
    this.warning = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WeeklyPlanDaysCompanion.insert({
    this.id = const Value.absent(),
    required int weeklyPlanId,
    required DateTime date,
    required String dayType,
    this.warning = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weeklyPlanId = Value(weeklyPlanId),
       date = Value(date),
       dayType = Value(dayType);
  static Insertable<WeeklyPlanDay> custom({
    Expression<int>? id,
    Expression<int>? weeklyPlanId,
    Expression<DateTime>? date,
    Expression<String>? dayType,
    Expression<String>? warning,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weeklyPlanId != null) 'weekly_plan_id': weeklyPlanId,
      if (date != null) 'date': date,
      if (dayType != null) 'day_type': dayType,
      if (warning != null) 'warning': warning,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WeeklyPlanDaysCompanion copyWith({
    Value<int>? id,
    Value<int>? weeklyPlanId,
    Value<DateTime>? date,
    Value<String>? dayType,
    Value<String?>? warning,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return WeeklyPlanDaysCompanion(
      id: id ?? this.id,
      weeklyPlanId: weeklyPlanId ?? this.weeklyPlanId,
      date: date ?? this.date,
      dayType: dayType ?? this.dayType,
      warning: warning ?? this.warning,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weeklyPlanId.present) {
      map['weekly_plan_id'] = Variable<int>(weeklyPlanId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (dayType.present) {
      map['day_type'] = Variable<String>(dayType.value);
    }
    if (warning.present) {
      map['warning'] = Variable<String>(warning.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyPlanDaysCompanion(')
          ..write('id: $id, ')
          ..write('weeklyPlanId: $weeklyPlanId, ')
          ..write('date: $date, ')
          ..write('dayType: $dayType, ')
          ..write('warning: $warning, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AsterDatabase extends GeneratedDatabase {
  _$AsterDatabase(QueryExecutor e) : super(e);
  $AsterDatabaseManager get managers => $AsterDatabaseManager(this);
  late final $StudentProfilesTable studentProfiles = $StudentProfilesTable(
    this,
  );
  late final $AttendancePoliciesTable attendancePolicies =
      $AttendancePoliciesTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $TimetableEntriesTable timetableEntries = $TimetableEntriesTable(
    this,
  );
  late final $LectureSessionsTable lectureSessions = $LectureSessionsTable(
    this,
  );
  late final $AttendanceRecordsTable attendanceRecords =
      $AttendanceRecordsTable(this);
  late final $InternshipRequirementsTable internshipRequirements =
      $InternshipRequirementsTable(this);
  late final $InternshipAvailabilityTable internshipAvailability =
      $InternshipAvailabilityTable(this);
  late final $InternshipSessionsTable internshipSessions =
      $InternshipSessionsTable(this);
  late final $WeeklyPlansTable weeklyPlans = $WeeklyPlansTable(this);
  late final $WeeklyPlanDaysTable weeklyPlanDays = $WeeklyPlanDaysTable(this);
  late final StudentProfileDao studentProfileDao = StudentProfileDao(
    this as AsterDatabase,
  );
  late final AttendancePolicyDao attendancePolicyDao = AttendancePolicyDao(
    this as AsterDatabase,
  );
  late final SubjectsDao subjectsDao = SubjectsDao(this as AsterDatabase);
  late final TimetableDao timetableDao = TimetableDao(this as AsterDatabase);
  late final LectureSessionsDao lectureSessionsDao = LectureSessionsDao(
    this as AsterDatabase,
  );
  late final AttendanceDao attendanceDao = AttendanceDao(this as AsterDatabase);
  late final InternshipDao internshipDao = InternshipDao(this as AsterDatabase);
  late final WeeklyPlansDao weeklyPlansDao = WeeklyPlansDao(
    this as AsterDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    studentProfiles,
    attendancePolicies,
    subjects,
    timetableEntries,
    lectureSessions,
    attendanceRecords,
    internshipRequirements,
    internshipAvailability,
    internshipSessions,
    weeklyPlans,
    weeklyPlanDays,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'student_profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('attendance_policies', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'student_profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('subjects', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'subjects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('timetable_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'subjects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('lecture_sessions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'timetable_entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('lecture_sessions', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'lecture_sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('attendance_records', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'subjects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('attendance_records', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'student_profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('internship_requirements', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'internship_requirements',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('internship_availability', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weekly_plans',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('weekly_plan_days', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$StudentProfilesTableCreateCompanionBuilder =
    StudentProfilesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> collegeName,
      Value<String?> course,
      Value<String?> semesterName,
      Value<DateTime?> semesterStartDate,
      Value<DateTime?> semesterEndDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$StudentProfilesTableUpdateCompanionBuilder =
    StudentProfilesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> collegeName,
      Value<String?> course,
      Value<String?> semesterName,
      Value<DateTime?> semesterStartDate,
      Value<DateTime?> semesterEndDate,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$StudentProfilesTableReferences
    extends
        BaseReferences<_$AsterDatabase, $StudentProfilesTable, StudentProfile> {
  $$StudentProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$AttendancePoliciesTable, List<AttendancePolicy>>
  _attendancePoliciesRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.attendancePolicies,
        aliasName: $_aliasNameGenerator(
          db.studentProfiles.id,
          db.attendancePolicies.studentProfileId,
        ),
      );

  $$AttendancePoliciesTableProcessedTableManager get attendancePoliciesRefs {
    final manager = $$AttendancePoliciesTableTableManager(
      $_db,
      $_db.attendancePolicies,
    ).filter((f) => f.studentProfileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _attendancePoliciesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SubjectsTable, List<Subject>> _subjectsRefsTable(
    _$AsterDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.subjects,
    aliasName: $_aliasNameGenerator(
      db.studentProfiles.id,
      db.subjects.studentProfileId,
    ),
  );

  $$SubjectsTableProcessedTableManager get subjectsRefs {
    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.studentProfileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_subjectsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $InternshipRequirementsTable,
    List<InternshipRequirement>
  >
  _internshipRequirementsRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.internshipRequirements,
        aliasName: $_aliasNameGenerator(
          db.studentProfiles.id,
          db.internshipRequirements.studentProfileId,
        ),
      );

  $$InternshipRequirementsTableProcessedTableManager
  get internshipRequirementsRefs {
    final manager = $$InternshipRequirementsTableTableManager(
      $_db,
      $_db.internshipRequirements,
    ).filter((f) => f.studentProfileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _internshipRequirementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StudentProfilesTableFilterComposer
    extends Composer<_$AsterDatabase, $StudentProfilesTable> {
  $$StudentProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get collegeName => $composableBuilder(
    column: $table.collegeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get course => $composableBuilder(
    column: $table.course,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semesterName => $composableBuilder(
    column: $table.semesterName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get semesterStartDate => $composableBuilder(
    column: $table.semesterStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get semesterEndDate => $composableBuilder(
    column: $table.semesterEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> attendancePoliciesRefs(
    Expression<bool> Function($$AttendancePoliciesTableFilterComposer f) f,
  ) {
    final $$AttendancePoliciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendancePolicies,
      getReferencedColumn: (t) => t.studentProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendancePoliciesTableFilterComposer(
            $db: $db,
            $table: $db.attendancePolicies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> subjectsRefs(
    Expression<bool> Function($$SubjectsTableFilterComposer f) f,
  ) {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.studentProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> internshipRequirementsRefs(
    Expression<bool> Function($$InternshipRequirementsTableFilterComposer f) f,
  ) {
    final $$InternshipRequirementsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.internshipRequirements,
          getReferencedColumn: (t) => t.studentProfileId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipRequirementsTableFilterComposer(
                $db: $db,
                $table: $db.internshipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StudentProfilesTableOrderingComposer
    extends Composer<_$AsterDatabase, $StudentProfilesTable> {
  $$StudentProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get collegeName => $composableBuilder(
    column: $table.collegeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get course => $composableBuilder(
    column: $table.course,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semesterName => $composableBuilder(
    column: $table.semesterName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get semesterStartDate => $composableBuilder(
    column: $table.semesterStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get semesterEndDate => $composableBuilder(
    column: $table.semesterEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentProfilesTableAnnotationComposer
    extends Composer<_$AsterDatabase, $StudentProfilesTable> {
  $$StudentProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get collegeName => $composableBuilder(
    column: $table.collegeName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get course =>
      $composableBuilder(column: $table.course, builder: (column) => column);

  GeneratedColumn<String> get semesterName => $composableBuilder(
    column: $table.semesterName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get semesterStartDate => $composableBuilder(
    column: $table.semesterStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get semesterEndDate => $composableBuilder(
    column: $table.semesterEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> attendancePoliciesRefs<T extends Object>(
    Expression<T> Function($$AttendancePoliciesTableAnnotationComposer a) f,
  ) {
    final $$AttendancePoliciesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.attendancePolicies,
          getReferencedColumn: (t) => t.studentProfileId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AttendancePoliciesTableAnnotationComposer(
                $db: $db,
                $table: $db.attendancePolicies,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> subjectsRefs<T extends Object>(
    Expression<T> Function($$SubjectsTableAnnotationComposer a) f,
  ) {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.studentProfileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> internshipRequirementsRefs<T extends Object>(
    Expression<T> Function($$InternshipRequirementsTableAnnotationComposer a) f,
  ) {
    final $$InternshipRequirementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.internshipRequirements,
          getReferencedColumn: (t) => t.studentProfileId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipRequirementsTableAnnotationComposer(
                $db: $db,
                $table: $db.internshipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StudentProfilesTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $StudentProfilesTable,
          StudentProfile,
          $$StudentProfilesTableFilterComposer,
          $$StudentProfilesTableOrderingComposer,
          $$StudentProfilesTableAnnotationComposer,
          $$StudentProfilesTableCreateCompanionBuilder,
          $$StudentProfilesTableUpdateCompanionBuilder,
          (StudentProfile, $$StudentProfilesTableReferences),
          StudentProfile,
          PrefetchHooks Function({
            bool attendancePoliciesRefs,
            bool subjectsRefs,
            bool internshipRequirementsRefs,
          })
        > {
  $$StudentProfilesTableTableManager(
    _$AsterDatabase db,
    $StudentProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> collegeName = const Value.absent(),
                Value<String?> course = const Value.absent(),
                Value<String?> semesterName = const Value.absent(),
                Value<DateTime?> semesterStartDate = const Value.absent(),
                Value<DateTime?> semesterEndDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StudentProfilesCompanion(
                id: id,
                name: name,
                collegeName: collegeName,
                course: course,
                semesterName: semesterName,
                semesterStartDate: semesterStartDate,
                semesterEndDate: semesterEndDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> collegeName = const Value.absent(),
                Value<String?> course = const Value.absent(),
                Value<String?> semesterName = const Value.absent(),
                Value<DateTime?> semesterStartDate = const Value.absent(),
                Value<DateTime?> semesterEndDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StudentProfilesCompanion.insert(
                id: id,
                name: name,
                collegeName: collegeName,
                course: course,
                semesterName: semesterName,
                semesterStartDate: semesterStartDate,
                semesterEndDate: semesterEndDate,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StudentProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                attendancePoliciesRefs = false,
                subjectsRefs = false,
                internshipRequirementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (attendancePoliciesRefs) db.attendancePolicies,
                    if (subjectsRefs) db.subjects,
                    if (internshipRequirementsRefs) db.internshipRequirements,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendancePoliciesRefs)
                        await $_getPrefetchedData<
                          StudentProfile,
                          $StudentProfilesTable,
                          AttendancePolicy
                        >(
                          currentTable: table,
                          referencedTable: $$StudentProfilesTableReferences
                              ._attendancePoliciesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).attendancePoliciesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentProfileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (subjectsRefs)
                        await $_getPrefetchedData<
                          StudentProfile,
                          $StudentProfilesTable,
                          Subject
                        >(
                          currentTable: table,
                          referencedTable: $$StudentProfilesTableReferences
                              ._subjectsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).subjectsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentProfileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (internshipRequirementsRefs)
                        await $_getPrefetchedData<
                          StudentProfile,
                          $StudentProfilesTable,
                          InternshipRequirement
                        >(
                          currentTable: table,
                          referencedTable: $$StudentProfilesTableReferences
                              ._internshipRequirementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).internshipRequirementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentProfileId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StudentProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $StudentProfilesTable,
      StudentProfile,
      $$StudentProfilesTableFilterComposer,
      $$StudentProfilesTableOrderingComposer,
      $$StudentProfilesTableAnnotationComposer,
      $$StudentProfilesTableCreateCompanionBuilder,
      $$StudentProfilesTableUpdateCompanionBuilder,
      (StudentProfile, $$StudentProfilesTableReferences),
      StudentProfile,
      PrefetchHooks Function({
        bool attendancePoliciesRefs,
        bool subjectsRefs,
        bool internshipRequirementsRefs,
      })
    >;
typedef $$AttendancePoliciesTableCreateCompanionBuilder =
    AttendancePoliciesCompanion Function({
      Value<int> id,
      required int studentProfileId,
      Value<double> requiredPercentage,
      Value<double> safetyTargetPercentage,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$AttendancePoliciesTableUpdateCompanionBuilder =
    AttendancePoliciesCompanion Function({
      Value<int> id,
      Value<int> studentProfileId,
      Value<double> requiredPercentage,
      Value<double> safetyTargetPercentage,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$AttendancePoliciesTableReferences
    extends
        BaseReferences<
          _$AsterDatabase,
          $AttendancePoliciesTable,
          AttendancePolicy
        > {
  $$AttendancePoliciesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentProfilesTable _studentProfileIdTable(_$AsterDatabase db) =>
      db.studentProfiles.createAlias(
        $_aliasNameGenerator(
          db.attendancePolicies.studentProfileId,
          db.studentProfiles.id,
        ),
      );

  $$StudentProfilesTableProcessedTableManager get studentProfileId {
    final $_column = $_itemColumn<int>('student_profile_id')!;

    final manager = $$StudentProfilesTableTableManager(
      $_db,
      $_db.studentProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendancePoliciesTableFilterComposer
    extends Composer<_$AsterDatabase, $AttendancePoliciesTable> {
  $$AttendancePoliciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get requiredPercentage => $composableBuilder(
    column: $table.requiredPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get safetyTargetPercentage => $composableBuilder(
    column: $table.safetyTargetPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentProfilesTableFilterComposer get studentProfileId {
    final $$StudentProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableFilterComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendancePoliciesTableOrderingComposer
    extends Composer<_$AsterDatabase, $AttendancePoliciesTable> {
  $$AttendancePoliciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get requiredPercentage => $composableBuilder(
    column: $table.requiredPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get safetyTargetPercentage => $composableBuilder(
    column: $table.safetyTargetPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentProfilesTableOrderingComposer get studentProfileId {
    final $$StudentProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendancePoliciesTableAnnotationComposer
    extends Composer<_$AsterDatabase, $AttendancePoliciesTable> {
  $$AttendancePoliciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get requiredPercentage => $composableBuilder(
    column: $table.requiredPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get safetyTargetPercentage => $composableBuilder(
    column: $table.safetyTargetPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StudentProfilesTableAnnotationComposer get studentProfileId {
    final $$StudentProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendancePoliciesTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $AttendancePoliciesTable,
          AttendancePolicy,
          $$AttendancePoliciesTableFilterComposer,
          $$AttendancePoliciesTableOrderingComposer,
          $$AttendancePoliciesTableAnnotationComposer,
          $$AttendancePoliciesTableCreateCompanionBuilder,
          $$AttendancePoliciesTableUpdateCompanionBuilder,
          (AttendancePolicy, $$AttendancePoliciesTableReferences),
          AttendancePolicy,
          PrefetchHooks Function({bool studentProfileId})
        > {
  $$AttendancePoliciesTableTableManager(
    _$AsterDatabase db,
    $AttendancePoliciesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendancePoliciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendancePoliciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendancePoliciesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentProfileId = const Value.absent(),
                Value<double> requiredPercentage = const Value.absent(),
                Value<double> safetyTargetPercentage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AttendancePoliciesCompanion(
                id: id,
                studentProfileId: studentProfileId,
                requiredPercentage: requiredPercentage,
                safetyTargetPercentage: safetyTargetPercentage,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentProfileId,
                Value<double> requiredPercentage = const Value.absent(),
                Value<double> safetyTargetPercentage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AttendancePoliciesCompanion.insert(
                id: id,
                studentProfileId: studentProfileId,
                requiredPercentage: requiredPercentage,
                safetyTargetPercentage: safetyTargetPercentage,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendancePoliciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({studentProfileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (studentProfileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.studentProfileId,
                                referencedTable:
                                    $$AttendancePoliciesTableReferences
                                        ._studentProfileIdTable(db),
                                referencedColumn:
                                    $$AttendancePoliciesTableReferences
                                        ._studentProfileIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendancePoliciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $AttendancePoliciesTable,
      AttendancePolicy,
      $$AttendancePoliciesTableFilterComposer,
      $$AttendancePoliciesTableOrderingComposer,
      $$AttendancePoliciesTableAnnotationComposer,
      $$AttendancePoliciesTableCreateCompanionBuilder,
      $$AttendancePoliciesTableUpdateCompanionBuilder,
      (AttendancePolicy, $$AttendancePoliciesTableReferences),
      AttendancePolicy,
      PrefetchHooks Function({bool studentProfileId})
    >;
typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      required int studentProfileId,
      required String name,
      Value<String?> code,
      required String subjectType,
      Value<bool> isMandatory,
      Value<int?> colorValue,
      Value<double?> requiredPercentageOverride,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      Value<int> studentProfileId,
      Value<String> name,
      Value<String?> code,
      Value<String> subjectType,
      Value<bool> isMandatory,
      Value<int?> colorValue,
      Value<double?> requiredPercentageOverride,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$SubjectsTableReferences
    extends BaseReferences<_$AsterDatabase, $SubjectsTable, Subject> {
  $$SubjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StudentProfilesTable _studentProfileIdTable(_$AsterDatabase db) =>
      db.studentProfiles.createAlias(
        $_aliasNameGenerator(
          db.subjects.studentProfileId,
          db.studentProfiles.id,
        ),
      );

  $$StudentProfilesTableProcessedTableManager get studentProfileId {
    final $_column = $_itemColumn<int>('student_profile_id')!;

    final manager = $$StudentProfilesTableTableManager(
      $_db,
      $_db.studentProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TimetableEntriesTable, List<TimetableEntry>>
  _timetableEntriesRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.timetableEntries,
        aliasName: $_aliasNameGenerator(
          db.subjects.id,
          db.timetableEntries.subjectId,
        ),
      );

  $$TimetableEntriesTableProcessedTableManager get timetableEntriesRefs {
    final manager = $$TimetableEntriesTableTableManager(
      $_db,
      $_db.timetableEntries,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _timetableEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LectureSessionsTable, List<LectureSession>>
  _lectureSessionsRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.lectureSessions,
        aliasName: $_aliasNameGenerator(
          db.subjects.id,
          db.lectureSessions.subjectId,
        ),
      );

  $$LectureSessionsTableProcessedTableManager get lectureSessionsRefs {
    final manager = $$LectureSessionsTableTableManager(
      $_db,
      $_db.lectureSessions,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _lectureSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AttendanceRecordsTable, List<AttendanceRecord>>
  _attendanceRecordsRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.attendanceRecords,
        aliasName: $_aliasNameGenerator(
          db.subjects.id,
          db.attendanceRecords.subjectId,
        ),
      );

  $$AttendanceRecordsTableProcessedTableManager get attendanceRecordsRefs {
    final manager = $$AttendanceRecordsTableTableManager(
      $_db,
      $_db.attendanceRecords,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _attendanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubjectsTableFilterComposer
    extends Composer<_$AsterDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectType => $composableBuilder(
    column: $table.subjectType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get requiredPercentageOverride => $composableBuilder(
    column: $table.requiredPercentageOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentProfilesTableFilterComposer get studentProfileId {
    final $$StudentProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableFilterComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> timetableEntriesRefs(
    Expression<bool> Function($$TimetableEntriesTableFilterComposer f) f,
  ) {
    final $$TimetableEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timetableEntries,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableEntriesTableFilterComposer(
            $db: $db,
            $table: $db.timetableEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lectureSessionsRefs(
    Expression<bool> Function($$LectureSessionsTableFilterComposer f) f,
  ) {
    final $$LectureSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableFilterComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> attendanceRecordsRefs(
    Expression<bool> Function($$AttendanceRecordsTableFilterComposer f) f,
  ) {
    final $$AttendanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendanceRecords,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.attendanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AsterDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectType => $composableBuilder(
    column: $table.subjectType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get requiredPercentageOverride => $composableBuilder(
    column: $table.requiredPercentageOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentProfilesTableOrderingComposer get studentProfileId {
    final $$StudentProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AsterDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get subjectType => $composableBuilder(
    column: $table.subjectType,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get requiredPercentageOverride => $composableBuilder(
    column: $table.requiredPercentageOverride,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StudentProfilesTableAnnotationComposer get studentProfileId {
    final $$StudentProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> timetableEntriesRefs<T extends Object>(
    Expression<T> Function($$TimetableEntriesTableAnnotationComposer a) f,
  ) {
    final $$TimetableEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timetableEntries,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.timetableEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lectureSessionsRefs<T extends Object>(
    Expression<T> Function($$LectureSessionsTableAnnotationComposer a) f,
  ) {
    final $$LectureSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> attendanceRecordsRefs<T extends Object>(
    Expression<T> Function($$AttendanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$AttendanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.attendanceRecords,
          getReferencedColumn: (t) => t.subjectId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AttendanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.attendanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, $$SubjectsTableReferences),
          Subject,
          PrefetchHooks Function({
            bool studentProfileId,
            bool timetableEntriesRefs,
            bool lectureSessionsRefs,
            bool attendanceRecordsRefs,
          })
        > {
  $$SubjectsTableTableManager(_$AsterDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentProfileId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String> subjectType = const Value.absent(),
                Value<bool> isMandatory = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<double?> requiredPercentageOverride =
                    const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SubjectsCompanion(
                id: id,
                studentProfileId: studentProfileId,
                name: name,
                code: code,
                subjectType: subjectType,
                isMandatory: isMandatory,
                colorValue: colorValue,
                requiredPercentageOverride: requiredPercentageOverride,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentProfileId,
                required String name,
                Value<String?> code = const Value.absent(),
                required String subjectType,
                Value<bool> isMandatory = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<double?> requiredPercentageOverride =
                    const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                studentProfileId: studentProfileId,
                name: name,
                code: code,
                subjectType: subjectType,
                isMandatory: isMandatory,
                colorValue: colorValue,
                requiredPercentageOverride: requiredPercentageOverride,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                studentProfileId = false,
                timetableEntriesRefs = false,
                lectureSessionsRefs = false,
                attendanceRecordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timetableEntriesRefs) db.timetableEntries,
                    if (lectureSessionsRefs) db.lectureSessions,
                    if (attendanceRecordsRefs) db.attendanceRecords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (studentProfileId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.studentProfileId,
                                    referencedTable: $$SubjectsTableReferences
                                        ._studentProfileIdTable(db),
                                    referencedColumn: $$SubjectsTableReferences
                                        ._studentProfileIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timetableEntriesRefs)
                        await $_getPrefetchedData<
                          Subject,
                          $SubjectsTable,
                          TimetableEntry
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectsTableReferences
                              ._timetableEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).timetableEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subjectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (lectureSessionsRefs)
                        await $_getPrefetchedData<
                          Subject,
                          $SubjectsTable,
                          LectureSession
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectsTableReferences
                              ._lectureSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).lectureSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subjectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (attendanceRecordsRefs)
                        await $_getPrefetchedData<
                          Subject,
                          $SubjectsTable,
                          AttendanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectsTableReferences
                              ._attendanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subjectId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, $$SubjectsTableReferences),
      Subject,
      PrefetchHooks Function({
        bool studentProfileId,
        bool timetableEntriesRefs,
        bool lectureSessionsRefs,
        bool attendanceRecordsRefs,
      })
    >;
typedef $$TimetableEntriesTableCreateCompanionBuilder =
    TimetableEntriesCompanion Function({
      Value<int> id,
      required int subjectId,
      required int weekday,
      required int startMinutes,
      required int endMinutes,
      Value<double> attendanceUnits,
      Value<bool> isMandatory,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$TimetableEntriesTableUpdateCompanionBuilder =
    TimetableEntriesCompanion Function({
      Value<int> id,
      Value<int> subjectId,
      Value<int> weekday,
      Value<int> startMinutes,
      Value<int> endMinutes,
      Value<double> attendanceUnits,
      Value<bool> isMandatory,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$TimetableEntriesTableReferences
    extends
        BaseReferences<
          _$AsterDatabase,
          $TimetableEntriesTable,
          TimetableEntry
        > {
  $$TimetableEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SubjectsTable _subjectIdTable(_$AsterDatabase db) =>
      db.subjects.createAlias(
        $_aliasNameGenerator(db.timetableEntries.subjectId, db.subjects.id),
      );

  $$SubjectsTableProcessedTableManager get subjectId {
    final $_column = $_itemColumn<int>('subject_id')!;

    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LectureSessionsTable, List<LectureSession>>
  _lectureSessionsRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.lectureSessions,
        aliasName: $_aliasNameGenerator(
          db.timetableEntries.id,
          db.lectureSessions.timetableEntryId,
        ),
      );

  $$LectureSessionsTableProcessedTableManager get lectureSessionsRefs {
    final manager = $$LectureSessionsTableTableManager(
      $_db,
      $_db.lectureSessions,
    ).filter((f) => f.timetableEntryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _lectureSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TimetableEntriesTableFilterComposer
    extends Composer<_$AsterDatabase, $TimetableEntriesTable> {
  $$TimetableEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get attendanceUnits => $composableBuilder(
    column: $table.attendanceUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> lectureSessionsRefs(
    Expression<bool> Function($$LectureSessionsTableFilterComposer f) f,
  ) {
    final $$LectureSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.timetableEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableFilterComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimetableEntriesTableOrderingComposer
    extends Composer<_$AsterDatabase, $TimetableEntriesTable> {
  $$TimetableEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get attendanceUnits => $composableBuilder(
    column: $table.attendanceUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableEntriesTableAnnotationComposer
    extends Composer<_$AsterDatabase, $TimetableEntriesTable> {
  $$TimetableEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<double> get attendanceUnits => $composableBuilder(
    column: $table.attendanceUnits,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> lectureSessionsRefs<T extends Object>(
    Expression<T> Function($$LectureSessionsTableAnnotationComposer a) f,
  ) {
    final $$LectureSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.timetableEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimetableEntriesTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $TimetableEntriesTable,
          TimetableEntry,
          $$TimetableEntriesTableFilterComposer,
          $$TimetableEntriesTableOrderingComposer,
          $$TimetableEntriesTableAnnotationComposer,
          $$TimetableEntriesTableCreateCompanionBuilder,
          $$TimetableEntriesTableUpdateCompanionBuilder,
          (TimetableEntry, $$TimetableEntriesTableReferences),
          TimetableEntry,
          PrefetchHooks Function({bool subjectId, bool lectureSessionsRefs})
        > {
  $$TimetableEntriesTableTableManager(
    _$AsterDatabase db,
    $TimetableEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimetableEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimetableEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimetableEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> subjectId = const Value.absent(),
                Value<int> weekday = const Value.absent(),
                Value<int> startMinutes = const Value.absent(),
                Value<int> endMinutes = const Value.absent(),
                Value<double> attendanceUnits = const Value.absent(),
                Value<bool> isMandatory = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TimetableEntriesCompanion(
                id: id,
                subjectId: subjectId,
                weekday: weekday,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                attendanceUnits: attendanceUnits,
                isMandatory: isMandatory,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int subjectId,
                required int weekday,
                required int startMinutes,
                required int endMinutes,
                Value<double> attendanceUnits = const Value.absent(),
                Value<bool> isMandatory = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TimetableEntriesCompanion.insert(
                id: id,
                subjectId: subjectId,
                weekday: weekday,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                attendanceUnits: attendanceUnits,
                isMandatory: isMandatory,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimetableEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({subjectId = false, lectureSessionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lectureSessionsRefs) db.lectureSessions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subjectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subjectId,
                                    referencedTable:
                                        $$TimetableEntriesTableReferences
                                            ._subjectIdTable(db),
                                    referencedColumn:
                                        $$TimetableEntriesTableReferences
                                            ._subjectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lectureSessionsRefs)
                        await $_getPrefetchedData<
                          TimetableEntry,
                          $TimetableEntriesTable,
                          LectureSession
                        >(
                          currentTable: table,
                          referencedTable: $$TimetableEntriesTableReferences
                              ._lectureSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimetableEntriesTableReferences(
                                db,
                                table,
                                p0,
                              ).lectureSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timetableEntryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TimetableEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $TimetableEntriesTable,
      TimetableEntry,
      $$TimetableEntriesTableFilterComposer,
      $$TimetableEntriesTableOrderingComposer,
      $$TimetableEntriesTableAnnotationComposer,
      $$TimetableEntriesTableCreateCompanionBuilder,
      $$TimetableEntriesTableUpdateCompanionBuilder,
      (TimetableEntry, $$TimetableEntriesTableReferences),
      TimetableEntry,
      PrefetchHooks Function({bool subjectId, bool lectureSessionsRefs})
    >;
typedef $$LectureSessionsTableCreateCompanionBuilder =
    LectureSessionsCompanion Function({
      Value<int> id,
      required int subjectId,
      Value<int?> timetableEntryId,
      required DateTime sessionDate,
      required int startMinutes,
      required int endMinutes,
      Value<double> attendanceUnits,
      required String sessionStatus,
      Value<bool> isMandatory,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$LectureSessionsTableUpdateCompanionBuilder =
    LectureSessionsCompanion Function({
      Value<int> id,
      Value<int> subjectId,
      Value<int?> timetableEntryId,
      Value<DateTime> sessionDate,
      Value<int> startMinutes,
      Value<int> endMinutes,
      Value<double> attendanceUnits,
      Value<String> sessionStatus,
      Value<bool> isMandatory,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$LectureSessionsTableReferences
    extends
        BaseReferences<_$AsterDatabase, $LectureSessionsTable, LectureSession> {
  $$LectureSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SubjectsTable _subjectIdTable(_$AsterDatabase db) =>
      db.subjects.createAlias(
        $_aliasNameGenerator(db.lectureSessions.subjectId, db.subjects.id),
      );

  $$SubjectsTableProcessedTableManager get subjectId {
    final $_column = $_itemColumn<int>('subject_id')!;

    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TimetableEntriesTable _timetableEntryIdTable(_$AsterDatabase db) =>
      db.timetableEntries.createAlias(
        $_aliasNameGenerator(
          db.lectureSessions.timetableEntryId,
          db.timetableEntries.id,
        ),
      );

  $$TimetableEntriesTableProcessedTableManager? get timetableEntryId {
    final $_column = $_itemColumn<int>('timetable_entry_id');
    if ($_column == null) return null;
    final manager = $$TimetableEntriesTableTableManager(
      $_db,
      $_db.timetableEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timetableEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AttendanceRecordsTable, List<AttendanceRecord>>
  _attendanceRecordsRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.attendanceRecords,
        aliasName: $_aliasNameGenerator(
          db.lectureSessions.id,
          db.attendanceRecords.lectureSessionId,
        ),
      );

  $$AttendanceRecordsTableProcessedTableManager get attendanceRecordsRefs {
    final manager = $$AttendanceRecordsTableTableManager(
      $_db,
      $_db.attendanceRecords,
    ).filter((f) => f.lectureSessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _attendanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LectureSessionsTableFilterComposer
    extends Composer<_$AsterDatabase, $LectureSessionsTable> {
  $$LectureSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get attendanceUnits => $composableBuilder(
    column: $table.attendanceUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionStatus => $composableBuilder(
    column: $table.sessionStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TimetableEntriesTableFilterComposer get timetableEntryId {
    final $$TimetableEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableEntryId,
      referencedTable: $db.timetableEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableEntriesTableFilterComposer(
            $db: $db,
            $table: $db.timetableEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> attendanceRecordsRefs(
    Expression<bool> Function($$AttendanceRecordsTableFilterComposer f) f,
  ) {
    final $$AttendanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendanceRecords,
      getReferencedColumn: (t) => t.lectureSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.attendanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LectureSessionsTableOrderingComposer
    extends Composer<_$AsterDatabase, $LectureSessionsTable> {
  $$LectureSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get attendanceUnits => $composableBuilder(
    column: $table.attendanceUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionStatus => $composableBuilder(
    column: $table.sessionStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TimetableEntriesTableOrderingComposer get timetableEntryId {
    final $$TimetableEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableEntryId,
      referencedTable: $db.timetableEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.timetableEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LectureSessionsTableAnnotationComposer
    extends Composer<_$AsterDatabase, $LectureSessionsTable> {
  $$LectureSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<double> get attendanceUnits => $composableBuilder(
    column: $table.attendanceUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionStatus => $composableBuilder(
    column: $table.sessionStatus,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMandatory => $composableBuilder(
    column: $table.isMandatory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TimetableEntriesTableAnnotationComposer get timetableEntryId {
    final $$TimetableEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableEntryId,
      referencedTable: $db.timetableEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.timetableEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> attendanceRecordsRefs<T extends Object>(
    Expression<T> Function($$AttendanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$AttendanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.attendanceRecords,
          getReferencedColumn: (t) => t.lectureSessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AttendanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.attendanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LectureSessionsTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $LectureSessionsTable,
          LectureSession,
          $$LectureSessionsTableFilterComposer,
          $$LectureSessionsTableOrderingComposer,
          $$LectureSessionsTableAnnotationComposer,
          $$LectureSessionsTableCreateCompanionBuilder,
          $$LectureSessionsTableUpdateCompanionBuilder,
          (LectureSession, $$LectureSessionsTableReferences),
          LectureSession,
          PrefetchHooks Function({
            bool subjectId,
            bool timetableEntryId,
            bool attendanceRecordsRefs,
          })
        > {
  $$LectureSessionsTableTableManager(
    _$AsterDatabase db,
    $LectureSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LectureSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LectureSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LectureSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> subjectId = const Value.absent(),
                Value<int?> timetableEntryId = const Value.absent(),
                Value<DateTime> sessionDate = const Value.absent(),
                Value<int> startMinutes = const Value.absent(),
                Value<int> endMinutes = const Value.absent(),
                Value<double> attendanceUnits = const Value.absent(),
                Value<String> sessionStatus = const Value.absent(),
                Value<bool> isMandatory = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LectureSessionsCompanion(
                id: id,
                subjectId: subjectId,
                timetableEntryId: timetableEntryId,
                sessionDate: sessionDate,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                attendanceUnits: attendanceUnits,
                sessionStatus: sessionStatus,
                isMandatory: isMandatory,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int subjectId,
                Value<int?> timetableEntryId = const Value.absent(),
                required DateTime sessionDate,
                required int startMinutes,
                required int endMinutes,
                Value<double> attendanceUnits = const Value.absent(),
                required String sessionStatus,
                Value<bool> isMandatory = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LectureSessionsCompanion.insert(
                id: id,
                subjectId: subjectId,
                timetableEntryId: timetableEntryId,
                sessionDate: sessionDate,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                attendanceUnits: attendanceUnits,
                sessionStatus: sessionStatus,
                isMandatory: isMandatory,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LectureSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                subjectId = false,
                timetableEntryId = false,
                attendanceRecordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (attendanceRecordsRefs) db.attendanceRecords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subjectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subjectId,
                                    referencedTable:
                                        $$LectureSessionsTableReferences
                                            ._subjectIdTable(db),
                                    referencedColumn:
                                        $$LectureSessionsTableReferences
                                            ._subjectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (timetableEntryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timetableEntryId,
                                    referencedTable:
                                        $$LectureSessionsTableReferences
                                            ._timetableEntryIdTable(db),
                                    referencedColumn:
                                        $$LectureSessionsTableReferences
                                            ._timetableEntryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendanceRecordsRefs)
                        await $_getPrefetchedData<
                          LectureSession,
                          $LectureSessionsTable,
                          AttendanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$LectureSessionsTableReferences
                              ._attendanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LectureSessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lectureSessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LectureSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $LectureSessionsTable,
      LectureSession,
      $$LectureSessionsTableFilterComposer,
      $$LectureSessionsTableOrderingComposer,
      $$LectureSessionsTableAnnotationComposer,
      $$LectureSessionsTableCreateCompanionBuilder,
      $$LectureSessionsTableUpdateCompanionBuilder,
      (LectureSession, $$LectureSessionsTableReferences),
      LectureSession,
      PrefetchHooks Function({
        bool subjectId,
        bool timetableEntryId,
        bool attendanceRecordsRefs,
      })
    >;
typedef $$AttendanceRecordsTableCreateCompanionBuilder =
    AttendanceRecordsCompanion Function({
      Value<int> id,
      required int lectureSessionId,
      required int subjectId,
      required String attendanceStatus,
      Value<double> countedUnits,
      Value<double> attendedUnits,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$AttendanceRecordsTableUpdateCompanionBuilder =
    AttendanceRecordsCompanion Function({
      Value<int> id,
      Value<int> lectureSessionId,
      Value<int> subjectId,
      Value<String> attendanceStatus,
      Value<double> countedUnits,
      Value<double> attendedUnits,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$AttendanceRecordsTableReferences
    extends
        BaseReferences<
          _$AsterDatabase,
          $AttendanceRecordsTable,
          AttendanceRecord
        > {
  $$AttendanceRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LectureSessionsTable _lectureSessionIdTable(_$AsterDatabase db) =>
      db.lectureSessions.createAlias(
        $_aliasNameGenerator(
          db.attendanceRecords.lectureSessionId,
          db.lectureSessions.id,
        ),
      );

  $$LectureSessionsTableProcessedTableManager get lectureSessionId {
    final $_column = $_itemColumn<int>('lecture_session_id')!;

    final manager = $$LectureSessionsTableTableManager(
      $_db,
      $_db.lectureSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lectureSessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SubjectsTable _subjectIdTable(_$AsterDatabase db) =>
      db.subjects.createAlias(
        $_aliasNameGenerator(db.attendanceRecords.subjectId, db.subjects.id),
      );

  $$SubjectsTableProcessedTableManager get subjectId {
    final $_column = $_itemColumn<int>('subject_id')!;

    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendanceRecordsTableFilterComposer
    extends Composer<_$AsterDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attendanceStatus => $composableBuilder(
    column: $table.attendanceStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get countedUnits => $composableBuilder(
    column: $table.countedUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get attendedUnits => $composableBuilder(
    column: $table.attendedUnits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LectureSessionsTableFilterComposer get lectureSessionId {
    final $$LectureSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lectureSessionId,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableFilterComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceRecordsTableOrderingComposer
    extends Composer<_$AsterDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attendanceStatus => $composableBuilder(
    column: $table.attendanceStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get countedUnits => $composableBuilder(
    column: $table.countedUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get attendedUnits => $composableBuilder(
    column: $table.attendedUnits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LectureSessionsTableOrderingComposer get lectureSessionId {
    final $$LectureSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lectureSessionId,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceRecordsTableAnnotationComposer
    extends Composer<_$AsterDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get attendanceStatus => $composableBuilder(
    column: $table.attendanceStatus,
    builder: (column) => column,
  );

  GeneratedColumn<double> get countedUnits => $composableBuilder(
    column: $table.countedUnits,
    builder: (column) => column,
  );

  GeneratedColumn<double> get attendedUnits => $composableBuilder(
    column: $table.attendedUnits,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LectureSessionsTableAnnotationComposer get lectureSessionId {
    final $$LectureSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lectureSessionId,
      referencedTable: $db.lectureSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LectureSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.lectureSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceRecordsTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $AttendanceRecordsTable,
          AttendanceRecord,
          $$AttendanceRecordsTableFilterComposer,
          $$AttendanceRecordsTableOrderingComposer,
          $$AttendanceRecordsTableAnnotationComposer,
          $$AttendanceRecordsTableCreateCompanionBuilder,
          $$AttendanceRecordsTableUpdateCompanionBuilder,
          (AttendanceRecord, $$AttendanceRecordsTableReferences),
          AttendanceRecord,
          PrefetchHooks Function({bool lectureSessionId, bool subjectId})
        > {
  $$AttendanceRecordsTableTableManager(
    _$AsterDatabase db,
    $AttendanceRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lectureSessionId = const Value.absent(),
                Value<int> subjectId = const Value.absent(),
                Value<String> attendanceStatus = const Value.absent(),
                Value<double> countedUnits = const Value.absent(),
                Value<double> attendedUnits = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AttendanceRecordsCompanion(
                id: id,
                lectureSessionId: lectureSessionId,
                subjectId: subjectId,
                attendanceStatus: attendanceStatus,
                countedUnits: countedUnits,
                attendedUnits: attendedUnits,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lectureSessionId,
                required int subjectId,
                required String attendanceStatus,
                Value<double> countedUnits = const Value.absent(),
                Value<double> attendedUnits = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AttendanceRecordsCompanion.insert(
                id: id,
                lectureSessionId: lectureSessionId,
                subjectId: subjectId,
                attendanceStatus: attendanceStatus,
                countedUnits: countedUnits,
                attendedUnits: attendedUnits,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendanceRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({lectureSessionId = false, subjectId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (lectureSessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lectureSessionId,
                                    referencedTable:
                                        $$AttendanceRecordsTableReferences
                                            ._lectureSessionIdTable(db),
                                    referencedColumn:
                                        $$AttendanceRecordsTableReferences
                                            ._lectureSessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (subjectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subjectId,
                                    referencedTable:
                                        $$AttendanceRecordsTableReferences
                                            ._subjectIdTable(db),
                                    referencedColumn:
                                        $$AttendanceRecordsTableReferences
                                            ._subjectIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AttendanceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $AttendanceRecordsTable,
      AttendanceRecord,
      $$AttendanceRecordsTableFilterComposer,
      $$AttendanceRecordsTableOrderingComposer,
      $$AttendanceRecordsTableAnnotationComposer,
      $$AttendanceRecordsTableCreateCompanionBuilder,
      $$AttendanceRecordsTableUpdateCompanionBuilder,
      (AttendanceRecord, $$AttendanceRecordsTableReferences),
      AttendanceRecord,
      PrefetchHooks Function({bool lectureSessionId, bool subjectId})
    >;
typedef $$InternshipRequirementsTableCreateCompanionBuilder =
    InternshipRequirementsCompanion Function({
      Value<int> id,
      required int studentProfileId,
      Value<int> requiredDaysPerWeek,
      Value<int?> requiredHoursPerWeek,
      Value<bool> allowsHalfDay,
      Value<int?> startMinutes,
      Value<int?> endMinutes,
      Value<int> travelMinutes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$InternshipRequirementsTableUpdateCompanionBuilder =
    InternshipRequirementsCompanion Function({
      Value<int> id,
      Value<int> studentProfileId,
      Value<int> requiredDaysPerWeek,
      Value<int?> requiredHoursPerWeek,
      Value<bool> allowsHalfDay,
      Value<int?> startMinutes,
      Value<int?> endMinutes,
      Value<int> travelMinutes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$InternshipRequirementsTableReferences
    extends
        BaseReferences<
          _$AsterDatabase,
          $InternshipRequirementsTable,
          InternshipRequirement
        > {
  $$InternshipRequirementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentProfilesTable _studentProfileIdTable(_$AsterDatabase db) =>
      db.studentProfiles.createAlias(
        $_aliasNameGenerator(
          db.internshipRequirements.studentProfileId,
          db.studentProfiles.id,
        ),
      );

  $$StudentProfilesTableProcessedTableManager get studentProfileId {
    final $_column = $_itemColumn<int>('student_profile_id')!;

    final manager = $$StudentProfilesTableTableManager(
      $_db,
      $_db.studentProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentProfileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $InternshipAvailabilityTable,
    List<InternshipAvailabilityData>
  >
  _internshipAvailabilityRefsTable(_$AsterDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.internshipAvailability,
        aliasName: $_aliasNameGenerator(
          db.internshipRequirements.id,
          db.internshipAvailability.internshipRequirementId,
        ),
      );

  $$InternshipAvailabilityTableProcessedTableManager
  get internshipAvailabilityRefs {
    final manager =
        $$InternshipAvailabilityTableTableManager(
          $_db,
          $_db.internshipAvailability,
        ).filter(
          (f) =>
              f.internshipRequirementId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _internshipAvailabilityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InternshipRequirementsTableFilterComposer
    extends Composer<_$AsterDatabase, $InternshipRequirementsTable> {
  $$InternshipRequirementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requiredDaysPerWeek => $composableBuilder(
    column: $table.requiredDaysPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requiredHoursPerWeek => $composableBuilder(
    column: $table.requiredHoursPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get allowsHalfDay => $composableBuilder(
    column: $table.allowsHalfDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get travelMinutes => $composableBuilder(
    column: $table.travelMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentProfilesTableFilterComposer get studentProfileId {
    final $$StudentProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableFilterComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> internshipAvailabilityRefs(
    Expression<bool> Function($$InternshipAvailabilityTableFilterComposer f) f,
  ) {
    final $$InternshipAvailabilityTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.internshipAvailability,
          getReferencedColumn: (t) => t.internshipRequirementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipAvailabilityTableFilterComposer(
                $db: $db,
                $table: $db.internshipAvailability,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$InternshipRequirementsTableOrderingComposer
    extends Composer<_$AsterDatabase, $InternshipRequirementsTable> {
  $$InternshipRequirementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requiredDaysPerWeek => $composableBuilder(
    column: $table.requiredDaysPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requiredHoursPerWeek => $composableBuilder(
    column: $table.requiredHoursPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get allowsHalfDay => $composableBuilder(
    column: $table.allowsHalfDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get travelMinutes => $composableBuilder(
    column: $table.travelMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentProfilesTableOrderingComposer get studentProfileId {
    final $$StudentProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InternshipRequirementsTableAnnotationComposer
    extends Composer<_$AsterDatabase, $InternshipRequirementsTable> {
  $$InternshipRequirementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get requiredDaysPerWeek => $composableBuilder(
    column: $table.requiredDaysPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<int> get requiredHoursPerWeek => $composableBuilder(
    column: $table.requiredHoursPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get allowsHalfDay => $composableBuilder(
    column: $table.allowsHalfDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get travelMinutes => $composableBuilder(
    column: $table.travelMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$StudentProfilesTableAnnotationComposer get studentProfileId {
    final $$StudentProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentProfileId,
      referencedTable: $db.studentProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.studentProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> internshipAvailabilityRefs<T extends Object>(
    Expression<T> Function($$InternshipAvailabilityTableAnnotationComposer a) f,
  ) {
    final $$InternshipAvailabilityTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.internshipAvailability,
          getReferencedColumn: (t) => t.internshipRequirementId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipAvailabilityTableAnnotationComposer(
                $db: $db,
                $table: $db.internshipAvailability,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$InternshipRequirementsTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $InternshipRequirementsTable,
          InternshipRequirement,
          $$InternshipRequirementsTableFilterComposer,
          $$InternshipRequirementsTableOrderingComposer,
          $$InternshipRequirementsTableAnnotationComposer,
          $$InternshipRequirementsTableCreateCompanionBuilder,
          $$InternshipRequirementsTableUpdateCompanionBuilder,
          (InternshipRequirement, $$InternshipRequirementsTableReferences),
          InternshipRequirement,
          PrefetchHooks Function({
            bool studentProfileId,
            bool internshipAvailabilityRefs,
          })
        > {
  $$InternshipRequirementsTableTableManager(
    _$AsterDatabase db,
    $InternshipRequirementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InternshipRequirementsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InternshipRequirementsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InternshipRequirementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentProfileId = const Value.absent(),
                Value<int> requiredDaysPerWeek = const Value.absent(),
                Value<int?> requiredHoursPerWeek = const Value.absent(),
                Value<bool> allowsHalfDay = const Value.absent(),
                Value<int?> startMinutes = const Value.absent(),
                Value<int?> endMinutes = const Value.absent(),
                Value<int> travelMinutes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InternshipRequirementsCompanion(
                id: id,
                studentProfileId: studentProfileId,
                requiredDaysPerWeek: requiredDaysPerWeek,
                requiredHoursPerWeek: requiredHoursPerWeek,
                allowsHalfDay: allowsHalfDay,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                travelMinutes: travelMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentProfileId,
                Value<int> requiredDaysPerWeek = const Value.absent(),
                Value<int?> requiredHoursPerWeek = const Value.absent(),
                Value<bool> allowsHalfDay = const Value.absent(),
                Value<int?> startMinutes = const Value.absent(),
                Value<int?> endMinutes = const Value.absent(),
                Value<int> travelMinutes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InternshipRequirementsCompanion.insert(
                id: id,
                studentProfileId: studentProfileId,
                requiredDaysPerWeek: requiredDaysPerWeek,
                requiredHoursPerWeek: requiredHoursPerWeek,
                allowsHalfDay: allowsHalfDay,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                travelMinutes: travelMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InternshipRequirementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({studentProfileId = false, internshipAvailabilityRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (internshipAvailabilityRefs) db.internshipAvailability,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (studentProfileId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.studentProfileId,
                                    referencedTable:
                                        $$InternshipRequirementsTableReferences
                                            ._studentProfileIdTable(db),
                                    referencedColumn:
                                        $$InternshipRequirementsTableReferences
                                            ._studentProfileIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (internshipAvailabilityRefs)
                        await $_getPrefetchedData<
                          InternshipRequirement,
                          $InternshipRequirementsTable,
                          InternshipAvailabilityData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$InternshipRequirementsTableReferences
                                  ._internshipAvailabilityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InternshipRequirementsTableReferences(
                                db,
                                table,
                                p0,
                              ).internshipAvailabilityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.internshipRequirementId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InternshipRequirementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $InternshipRequirementsTable,
      InternshipRequirement,
      $$InternshipRequirementsTableFilterComposer,
      $$InternshipRequirementsTableOrderingComposer,
      $$InternshipRequirementsTableAnnotationComposer,
      $$InternshipRequirementsTableCreateCompanionBuilder,
      $$InternshipRequirementsTableUpdateCompanionBuilder,
      (InternshipRequirement, $$InternshipRequirementsTableReferences),
      InternshipRequirement,
      PrefetchHooks Function({
        bool studentProfileId,
        bool internshipAvailabilityRefs,
      })
    >;
typedef $$InternshipAvailabilityTableCreateCompanionBuilder =
    InternshipAvailabilityCompanion Function({
      Value<int> id,
      required int internshipRequirementId,
      required int weekday,
      Value<bool> isAvailable,
      Value<bool> isFixed,
      Value<String?> availabilityType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$InternshipAvailabilityTableUpdateCompanionBuilder =
    InternshipAvailabilityCompanion Function({
      Value<int> id,
      Value<int> internshipRequirementId,
      Value<int> weekday,
      Value<bool> isAvailable,
      Value<bool> isFixed,
      Value<String?> availabilityType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$InternshipAvailabilityTableReferences
    extends
        BaseReferences<
          _$AsterDatabase,
          $InternshipAvailabilityTable,
          InternshipAvailabilityData
        > {
  $$InternshipAvailabilityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InternshipRequirementsTable _internshipRequirementIdTable(
    _$AsterDatabase db,
  ) => db.internshipRequirements.createAlias(
    $_aliasNameGenerator(
      db.internshipAvailability.internshipRequirementId,
      db.internshipRequirements.id,
    ),
  );

  $$InternshipRequirementsTableProcessedTableManager
  get internshipRequirementId {
    final $_column = $_itemColumn<int>('internship_requirement_id')!;

    final manager = $$InternshipRequirementsTableTableManager(
      $_db,
      $_db.internshipRequirements,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _internshipRequirementIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InternshipAvailabilityTableFilterComposer
    extends Composer<_$AsterDatabase, $InternshipAvailabilityTable> {
  $$InternshipAvailabilityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFixed => $composableBuilder(
    column: $table.isFixed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get availabilityType => $composableBuilder(
    column: $table.availabilityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InternshipRequirementsTableFilterComposer get internshipRequirementId {
    final $$InternshipRequirementsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.internshipRequirementId,
          referencedTable: $db.internshipRequirements,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipRequirementsTableFilterComposer(
                $db: $db,
                $table: $db.internshipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InternshipAvailabilityTableOrderingComposer
    extends Composer<_$AsterDatabase, $InternshipAvailabilityTable> {
  $$InternshipAvailabilityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFixed => $composableBuilder(
    column: $table.isFixed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availabilityType => $composableBuilder(
    column: $table.availabilityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InternshipRequirementsTableOrderingComposer get internshipRequirementId {
    final $$InternshipRequirementsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.internshipRequirementId,
          referencedTable: $db.internshipRequirements,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipRequirementsTableOrderingComposer(
                $db: $db,
                $table: $db.internshipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InternshipAvailabilityTableAnnotationComposer
    extends Composer<_$AsterDatabase, $InternshipAvailabilityTable> {
  $$InternshipAvailabilityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFixed =>
      $composableBuilder(column: $table.isFixed, builder: (column) => column);

  GeneratedColumn<String> get availabilityType => $composableBuilder(
    column: $table.availabilityType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$InternshipRequirementsTableAnnotationComposer get internshipRequirementId {
    final $$InternshipRequirementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.internshipRequirementId,
          referencedTable: $db.internshipRequirements,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InternshipRequirementsTableAnnotationComposer(
                $db: $db,
                $table: $db.internshipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InternshipAvailabilityTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $InternshipAvailabilityTable,
          InternshipAvailabilityData,
          $$InternshipAvailabilityTableFilterComposer,
          $$InternshipAvailabilityTableOrderingComposer,
          $$InternshipAvailabilityTableAnnotationComposer,
          $$InternshipAvailabilityTableCreateCompanionBuilder,
          $$InternshipAvailabilityTableUpdateCompanionBuilder,
          (InternshipAvailabilityData, $$InternshipAvailabilityTableReferences),
          InternshipAvailabilityData,
          PrefetchHooks Function({bool internshipRequirementId})
        > {
  $$InternshipAvailabilityTableTableManager(
    _$AsterDatabase db,
    $InternshipAvailabilityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InternshipAvailabilityTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InternshipAvailabilityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InternshipAvailabilityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> internshipRequirementId = const Value.absent(),
                Value<int> weekday = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                Value<bool> isFixed = const Value.absent(),
                Value<String?> availabilityType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InternshipAvailabilityCompanion(
                id: id,
                internshipRequirementId: internshipRequirementId,
                weekday: weekday,
                isAvailable: isAvailable,
                isFixed: isFixed,
                availabilityType: availabilityType,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int internshipRequirementId,
                required int weekday,
                Value<bool> isAvailable = const Value.absent(),
                Value<bool> isFixed = const Value.absent(),
                Value<String?> availabilityType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InternshipAvailabilityCompanion.insert(
                id: id,
                internshipRequirementId: internshipRequirementId,
                weekday: weekday,
                isAvailable: isAvailable,
                isFixed: isFixed,
                availabilityType: availabilityType,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InternshipAvailabilityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({internshipRequirementId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (internshipRequirementId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.internshipRequirementId,
                                referencedTable:
                                    $$InternshipAvailabilityTableReferences
                                        ._internshipRequirementIdTable(db),
                                referencedColumn:
                                    $$InternshipAvailabilityTableReferences
                                        ._internshipRequirementIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InternshipAvailabilityTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $InternshipAvailabilityTable,
      InternshipAvailabilityData,
      $$InternshipAvailabilityTableFilterComposer,
      $$InternshipAvailabilityTableOrderingComposer,
      $$InternshipAvailabilityTableAnnotationComposer,
      $$InternshipAvailabilityTableCreateCompanionBuilder,
      $$InternshipAvailabilityTableUpdateCompanionBuilder,
      (InternshipAvailabilityData, $$InternshipAvailabilityTableReferences),
      InternshipAvailabilityData,
      PrefetchHooks Function({bool internshipRequirementId})
    >;
typedef $$InternshipSessionsTableCreateCompanionBuilder =
    InternshipSessionsCompanion Function({
      Value<int> id,
      required DateTime sessionDate,
      required int startMinutes,
      required int endMinutes,
      required String sessionType,
      required String status,
      Value<int> completedMinutes,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$InternshipSessionsTableUpdateCompanionBuilder =
    InternshipSessionsCompanion Function({
      Value<int> id,
      Value<DateTime> sessionDate,
      Value<int> startMinutes,
      Value<int> endMinutes,
      Value<String> sessionType,
      Value<String> status,
      Value<int> completedMinutes,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$InternshipSessionsTableFilterComposer
    extends Composer<_$AsterDatabase, $InternshipSessionsTable> {
  $$InternshipSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionType => $composableBuilder(
    column: $table.sessionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedMinutes => $composableBuilder(
    column: $table.completedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InternshipSessionsTableOrderingComposer
    extends Composer<_$AsterDatabase, $InternshipSessionsTable> {
  $$InternshipSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionType => $composableBuilder(
    column: $table.sessionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedMinutes => $composableBuilder(
    column: $table.completedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InternshipSessionsTableAnnotationComposer
    extends Composer<_$AsterDatabase, $InternshipSessionsTable> {
  $$InternshipSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionDate => $composableBuilder(
    column: $table.sessionDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionType => $composableBuilder(
    column: $table.sessionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get completedMinutes => $composableBuilder(
    column: $table.completedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$InternshipSessionsTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $InternshipSessionsTable,
          InternshipSession,
          $$InternshipSessionsTableFilterComposer,
          $$InternshipSessionsTableOrderingComposer,
          $$InternshipSessionsTableAnnotationComposer,
          $$InternshipSessionsTableCreateCompanionBuilder,
          $$InternshipSessionsTableUpdateCompanionBuilder,
          (
            InternshipSession,
            BaseReferences<
              _$AsterDatabase,
              $InternshipSessionsTable,
              InternshipSession
            >,
          ),
          InternshipSession,
          PrefetchHooks Function()
        > {
  $$InternshipSessionsTableTableManager(
    _$AsterDatabase db,
    $InternshipSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InternshipSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InternshipSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InternshipSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> sessionDate = const Value.absent(),
                Value<int> startMinutes = const Value.absent(),
                Value<int> endMinutes = const Value.absent(),
                Value<String> sessionType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> completedMinutes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InternshipSessionsCompanion(
                id: id,
                sessionDate: sessionDate,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                sessionType: sessionType,
                status: status,
                completedMinutes: completedMinutes,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime sessionDate,
                required int startMinutes,
                required int endMinutes,
                required String sessionType,
                required String status,
                Value<int> completedMinutes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InternshipSessionsCompanion.insert(
                id: id,
                sessionDate: sessionDate,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
                sessionType: sessionType,
                status: status,
                completedMinutes: completedMinutes,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InternshipSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $InternshipSessionsTable,
      InternshipSession,
      $$InternshipSessionsTableFilterComposer,
      $$InternshipSessionsTableOrderingComposer,
      $$InternshipSessionsTableAnnotationComposer,
      $$InternshipSessionsTableCreateCompanionBuilder,
      $$InternshipSessionsTableUpdateCompanionBuilder,
      (
        InternshipSession,
        BaseReferences<
          _$AsterDatabase,
          $InternshipSessionsTable,
          InternshipSession
        >,
      ),
      InternshipSession,
      PrefetchHooks Function()
    >;
typedef $$WeeklyPlansTableCreateCompanionBuilder =
    WeeklyPlansCompanion Function({
      Value<int> id,
      required DateTime weekStartDate,
      required String planType,
      Value<double?> riskScore,
      Value<bool> isSelected,
      Value<bool> isValid,
      Value<String?> explanation,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$WeeklyPlansTableUpdateCompanionBuilder =
    WeeklyPlansCompanion Function({
      Value<int> id,
      Value<DateTime> weekStartDate,
      Value<String> planType,
      Value<double?> riskScore,
      Value<bool> isSelected,
      Value<bool> isValid,
      Value<String?> explanation,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$WeeklyPlansTableReferences
    extends BaseReferences<_$AsterDatabase, $WeeklyPlansTable, WeeklyPlan> {
  $$WeeklyPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WeeklyPlanDaysTable, List<WeeklyPlanDay>>
  _weeklyPlanDaysRefsTable(_$AsterDatabase db) => MultiTypedResultKey.fromTable(
    db.weeklyPlanDays,
    aliasName: $_aliasNameGenerator(
      db.weeklyPlans.id,
      db.weeklyPlanDays.weeklyPlanId,
    ),
  );

  $$WeeklyPlanDaysTableProcessedTableManager get weeklyPlanDaysRefs {
    final manager = $$WeeklyPlanDaysTableTableManager(
      $_db,
      $_db.weeklyPlanDays,
    ).filter((f) => f.weeklyPlanId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_weeklyPlanDaysRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WeeklyPlansTableFilterComposer
    extends Composer<_$AsterDatabase, $WeeklyPlansTable> {
  $$WeeklyPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planType => $composableBuilder(
    column: $table.planType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get riskScore => $composableBuilder(
    column: $table.riskScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isValid => $composableBuilder(
    column: $table.isValid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> weeklyPlanDaysRefs(
    Expression<bool> Function($$WeeklyPlanDaysTableFilterComposer f) f,
  ) {
    final $$WeeklyPlanDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weeklyPlanDays,
      getReferencedColumn: (t) => t.weeklyPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPlanDaysTableFilterComposer(
            $db: $db,
            $table: $db.weeklyPlanDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeeklyPlansTableOrderingComposer
    extends Composer<_$AsterDatabase, $WeeklyPlansTable> {
  $$WeeklyPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planType => $composableBuilder(
    column: $table.planType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get riskScore => $composableBuilder(
    column: $table.riskScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isValid => $composableBuilder(
    column: $table.isValid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeeklyPlansTableAnnotationComposer
    extends Composer<_$AsterDatabase, $WeeklyPlansTable> {
  $$WeeklyPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get weekStartDate => $composableBuilder(
    column: $table.weekStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get planType =>
      $composableBuilder(column: $table.planType, builder: (column) => column);

  GeneratedColumn<double> get riskScore =>
      $composableBuilder(column: $table.riskScore, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isValid =>
      $composableBuilder(column: $table.isValid, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> weeklyPlanDaysRefs<T extends Object>(
    Expression<T> Function($$WeeklyPlanDaysTableAnnotationComposer a) f,
  ) {
    final $$WeeklyPlanDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weeklyPlanDays,
      getReferencedColumn: (t) => t.weeklyPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPlanDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.weeklyPlanDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeeklyPlansTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $WeeklyPlansTable,
          WeeklyPlan,
          $$WeeklyPlansTableFilterComposer,
          $$WeeklyPlansTableOrderingComposer,
          $$WeeklyPlansTableAnnotationComposer,
          $$WeeklyPlansTableCreateCompanionBuilder,
          $$WeeklyPlansTableUpdateCompanionBuilder,
          (WeeklyPlan, $$WeeklyPlansTableReferences),
          WeeklyPlan,
          PrefetchHooks Function({bool weeklyPlanDaysRefs})
        > {
  $$WeeklyPlansTableTableManager(_$AsterDatabase db, $WeeklyPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> weekStartDate = const Value.absent(),
                Value<String> planType = const Value.absent(),
                Value<double?> riskScore = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<bool> isValid = const Value.absent(),
                Value<String?> explanation = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WeeklyPlansCompanion(
                id: id,
                weekStartDate: weekStartDate,
                planType: planType,
                riskScore: riskScore,
                isSelected: isSelected,
                isValid: isValid,
                explanation: explanation,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime weekStartDate,
                required String planType,
                Value<double?> riskScore = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
                Value<bool> isValid = const Value.absent(),
                Value<String?> explanation = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WeeklyPlansCompanion.insert(
                id: id,
                weekStartDate: weekStartDate,
                planType: planType,
                riskScore: riskScore,
                isSelected: isSelected,
                isValid: isValid,
                explanation: explanation,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeeklyPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({weeklyPlanDaysRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (weeklyPlanDaysRefs) db.weeklyPlanDays,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (weeklyPlanDaysRefs)
                    await $_getPrefetchedData<
                      WeeklyPlan,
                      $WeeklyPlansTable,
                      WeeklyPlanDay
                    >(
                      currentTable: table,
                      referencedTable: $$WeeklyPlansTableReferences
                          ._weeklyPlanDaysRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WeeklyPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).weeklyPlanDaysRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.weeklyPlanId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WeeklyPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $WeeklyPlansTable,
      WeeklyPlan,
      $$WeeklyPlansTableFilterComposer,
      $$WeeklyPlansTableOrderingComposer,
      $$WeeklyPlansTableAnnotationComposer,
      $$WeeklyPlansTableCreateCompanionBuilder,
      $$WeeklyPlansTableUpdateCompanionBuilder,
      (WeeklyPlan, $$WeeklyPlansTableReferences),
      WeeklyPlan,
      PrefetchHooks Function({bool weeklyPlanDaysRefs})
    >;
typedef $$WeeklyPlanDaysTableCreateCompanionBuilder =
    WeeklyPlanDaysCompanion Function({
      Value<int> id,
      required int weeklyPlanId,
      required DateTime date,
      required String dayType,
      Value<String?> warning,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$WeeklyPlanDaysTableUpdateCompanionBuilder =
    WeeklyPlanDaysCompanion Function({
      Value<int> id,
      Value<int> weeklyPlanId,
      Value<DateTime> date,
      Value<String> dayType,
      Value<String?> warning,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$WeeklyPlanDaysTableReferences
    extends
        BaseReferences<_$AsterDatabase, $WeeklyPlanDaysTable, WeeklyPlanDay> {
  $$WeeklyPlanDaysTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WeeklyPlansTable _weeklyPlanIdTable(_$AsterDatabase db) =>
      db.weeklyPlans.createAlias(
        $_aliasNameGenerator(db.weeklyPlanDays.weeklyPlanId, db.weeklyPlans.id),
      );

  $$WeeklyPlansTableProcessedTableManager get weeklyPlanId {
    final $_column = $_itemColumn<int>('weekly_plan_id')!;

    final manager = $$WeeklyPlansTableTableManager(
      $_db,
      $_db.weeklyPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weeklyPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeeklyPlanDaysTableFilterComposer
    extends Composer<_$AsterDatabase, $WeeklyPlanDaysTable> {
  $$WeeklyPlanDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayType => $composableBuilder(
    column: $table.dayType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warning => $composableBuilder(
    column: $table.warning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeeklyPlansTableFilterComposer get weeklyPlanId {
    final $$WeeklyPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weeklyPlanId,
      referencedTable: $db.weeklyPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPlansTableFilterComposer(
            $db: $db,
            $table: $db.weeklyPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeeklyPlanDaysTableOrderingComposer
    extends Composer<_$AsterDatabase, $WeeklyPlanDaysTable> {
  $$WeeklyPlanDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayType => $composableBuilder(
    column: $table.dayType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warning => $composableBuilder(
    column: $table.warning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeeklyPlansTableOrderingComposer get weeklyPlanId {
    final $$WeeklyPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weeklyPlanId,
      referencedTable: $db.weeklyPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPlansTableOrderingComposer(
            $db: $db,
            $table: $db.weeklyPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeeklyPlanDaysTableAnnotationComposer
    extends Composer<_$AsterDatabase, $WeeklyPlanDaysTable> {
  $$WeeklyPlanDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get dayType =>
      $composableBuilder(column: $table.dayType, builder: (column) => column);

  GeneratedColumn<String> get warning =>
      $composableBuilder(column: $table.warning, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeeklyPlansTableAnnotationComposer get weeklyPlanId {
    final $$WeeklyPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weeklyPlanId,
      referencedTable: $db.weeklyPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.weeklyPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeeklyPlanDaysTableTableManager
    extends
        RootTableManager<
          _$AsterDatabase,
          $WeeklyPlanDaysTable,
          WeeklyPlanDay,
          $$WeeklyPlanDaysTableFilterComposer,
          $$WeeklyPlanDaysTableOrderingComposer,
          $$WeeklyPlanDaysTableAnnotationComposer,
          $$WeeklyPlanDaysTableCreateCompanionBuilder,
          $$WeeklyPlanDaysTableUpdateCompanionBuilder,
          (WeeklyPlanDay, $$WeeklyPlanDaysTableReferences),
          WeeklyPlanDay,
          PrefetchHooks Function({bool weeklyPlanId})
        > {
  $$WeeklyPlanDaysTableTableManager(
    _$AsterDatabase db,
    $WeeklyPlanDaysTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyPlanDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyPlanDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyPlanDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weeklyPlanId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> dayType = const Value.absent(),
                Value<String?> warning = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WeeklyPlanDaysCompanion(
                id: id,
                weeklyPlanId: weeklyPlanId,
                date: date,
                dayType: dayType,
                warning: warning,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weeklyPlanId,
                required DateTime date,
                required String dayType,
                Value<String?> warning = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WeeklyPlanDaysCompanion.insert(
                id: id,
                weeklyPlanId: weeklyPlanId,
                date: date,
                dayType: dayType,
                warning: warning,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeeklyPlanDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({weeklyPlanId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (weeklyPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.weeklyPlanId,
                                referencedTable: $$WeeklyPlanDaysTableReferences
                                    ._weeklyPlanIdTable(db),
                                referencedColumn:
                                    $$WeeklyPlanDaysTableReferences
                                        ._weeklyPlanIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WeeklyPlanDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AsterDatabase,
      $WeeklyPlanDaysTable,
      WeeklyPlanDay,
      $$WeeklyPlanDaysTableFilterComposer,
      $$WeeklyPlanDaysTableOrderingComposer,
      $$WeeklyPlanDaysTableAnnotationComposer,
      $$WeeklyPlanDaysTableCreateCompanionBuilder,
      $$WeeklyPlanDaysTableUpdateCompanionBuilder,
      (WeeklyPlanDay, $$WeeklyPlanDaysTableReferences),
      WeeklyPlanDay,
      PrefetchHooks Function({bool weeklyPlanId})
    >;

class $AsterDatabaseManager {
  final _$AsterDatabase _db;
  $AsterDatabaseManager(this._db);
  $$StudentProfilesTableTableManager get studentProfiles =>
      $$StudentProfilesTableTableManager(_db, _db.studentProfiles);
  $$AttendancePoliciesTableTableManager get attendancePolicies =>
      $$AttendancePoliciesTableTableManager(_db, _db.attendancePolicies);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$TimetableEntriesTableTableManager get timetableEntries =>
      $$TimetableEntriesTableTableManager(_db, _db.timetableEntries);
  $$LectureSessionsTableTableManager get lectureSessions =>
      $$LectureSessionsTableTableManager(_db, _db.lectureSessions);
  $$AttendanceRecordsTableTableManager get attendanceRecords =>
      $$AttendanceRecordsTableTableManager(_db, _db.attendanceRecords);
  $$InternshipRequirementsTableTableManager get internshipRequirements =>
      $$InternshipRequirementsTableTableManager(
        _db,
        _db.internshipRequirements,
      );
  $$InternshipAvailabilityTableTableManager get internshipAvailability =>
      $$InternshipAvailabilityTableTableManager(
        _db,
        _db.internshipAvailability,
      );
  $$InternshipSessionsTableTableManager get internshipSessions =>
      $$InternshipSessionsTableTableManager(_db, _db.internshipSessions);
  $$WeeklyPlansTableTableManager get weeklyPlans =>
      $$WeeklyPlansTableTableManager(_db, _db.weeklyPlans);
  $$WeeklyPlanDaysTableTableManager get weeklyPlanDays =>
      $$WeeklyPlanDaysTableTableManager(_db, _db.weeklyPlanDays);
}
