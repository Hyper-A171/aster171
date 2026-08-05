// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'b69ece71b29b116136a0f766effe13ebd0560425';

/// See also [database].
@ProviderFor(database)
final databaseProvider = Provider<AsterDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = ProviderRef<AsterDatabase>;
String _$subjectsRepositoryHash() =>
    r'0dc311c968edac0fc0d710ea5d76020cc20b49e3';

/// See also [subjectsRepository].
@ProviderFor(subjectsRepository)
final subjectsRepositoryProvider = Provider<SubjectsRepository>.internal(
  subjectsRepository,
  name: r'subjectsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subjectsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubjectsRepositoryRef = ProviderRef<SubjectsRepository>;
String _$studentRepositoryHash() => r'25d92917e762cb4650a9ffea0eaa4e1e18e92ab0';

/// See also [studentRepository].
@ProviderFor(studentRepository)
final studentRepositoryProvider = Provider<StudentRepository>.internal(
  studentRepository,
  name: r'studentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$studentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StudentRepositoryRef = ProviderRef<StudentRepository>;
String _$attendancePolicyRepositoryHash() =>
    r'a2648620570199d43d86149acadfd9da06b17c60';

/// See also [attendancePolicyRepository].
@ProviderFor(attendancePolicyRepository)
final attendancePolicyRepositoryProvider =
    Provider<AttendancePolicyRepository>.internal(
      attendancePolicyRepository,
      name: r'attendancePolicyRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$attendancePolicyRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttendancePolicyRepositoryRef = ProviderRef<AttendancePolicyRepository>;
String _$attendanceRepositoryHash() =>
    r'54a4cf2b366ea97b7e302118b4cbe946cd521416';

/// See also [attendanceRepository].
@ProviderFor(attendanceRepository)
final attendanceRepositoryProvider = Provider<AttendanceRepository>.internal(
  attendanceRepository,
  name: r'attendanceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttendanceRepositoryRef = ProviderRef<AttendanceRepository>;
String _$activeSubjectsHash() => r'5fda1a4ff90b23b91abb6b8c89cecbfcd3dd4bff';

/// See also [activeSubjects].
@ProviderFor(activeSubjects)
final activeSubjectsProvider =
    AutoDisposeStreamProvider<List<Subject>>.internal(
      activeSubjects,
      name: r'activeSubjectsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeSubjectsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveSubjectsRef = AutoDisposeStreamProviderRef<List<Subject>>;
String _$subjectDetailHash() => r'fe190ac1c0b99c342b1322f049b583eb1f29389f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [subjectDetail].
@ProviderFor(subjectDetail)
const subjectDetailProvider = SubjectDetailFamily();

/// See also [subjectDetail].
class SubjectDetailFamily extends Family<AsyncValue<Subject>> {
  /// See also [subjectDetail].
  const SubjectDetailFamily();

  /// See also [subjectDetail].
  SubjectDetailProvider call(int id) {
    return SubjectDetailProvider(id);
  }

  @override
  SubjectDetailProvider getProviderOverride(
    covariant SubjectDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subjectDetailProvider';
}

/// See also [subjectDetail].
class SubjectDetailProvider extends AutoDisposeStreamProvider<Subject> {
  /// See also [subjectDetail].
  SubjectDetailProvider(int id)
    : this._internal(
        (ref) => subjectDetail(ref as SubjectDetailRef, id),
        from: subjectDetailProvider,
        name: r'subjectDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$subjectDetailHash,
        dependencies: SubjectDetailFamily._dependencies,
        allTransitiveDependencies:
            SubjectDetailFamily._allTransitiveDependencies,
        id: id,
      );

  SubjectDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<Subject> Function(SubjectDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubjectDetailProvider._internal(
        (ref) => create(ref as SubjectDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Subject> createElement() {
    return _SubjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubjectDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubjectDetailRef on AutoDisposeStreamProviderRef<Subject> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubjectDetailProviderElement
    extends AutoDisposeStreamProviderElement<Subject>
    with SubjectDetailRef {
  _SubjectDetailProviderElement(super.provider);

  @override
  int get id => (origin as SubjectDetailProvider).id;
}

String _$subjectAttendanceHistoryHash() =>
    r'744058f1e7543763ba2042e21d55dbbd05b6efaf';

/// See also [subjectAttendanceHistory].
@ProviderFor(subjectAttendanceHistory)
const subjectAttendanceHistoryProvider = SubjectAttendanceHistoryFamily();

/// See also [subjectAttendanceHistory].
class SubjectAttendanceHistoryFamily
    extends Family<AsyncValue<List<AttendanceRecord>>> {
  /// See also [subjectAttendanceHistory].
  const SubjectAttendanceHistoryFamily();

  /// See also [subjectAttendanceHistory].
  SubjectAttendanceHistoryProvider call(int subjectId) {
    return SubjectAttendanceHistoryProvider(subjectId);
  }

  @override
  SubjectAttendanceHistoryProvider getProviderOverride(
    covariant SubjectAttendanceHistoryProvider provider,
  ) {
    return call(provider.subjectId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subjectAttendanceHistoryProvider';
}

/// See also [subjectAttendanceHistory].
class SubjectAttendanceHistoryProvider
    extends AutoDisposeStreamProvider<List<AttendanceRecord>> {
  /// See also [subjectAttendanceHistory].
  SubjectAttendanceHistoryProvider(int subjectId)
    : this._internal(
        (ref) => subjectAttendanceHistory(
          ref as SubjectAttendanceHistoryRef,
          subjectId,
        ),
        from: subjectAttendanceHistoryProvider,
        name: r'subjectAttendanceHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$subjectAttendanceHistoryHash,
        dependencies: SubjectAttendanceHistoryFamily._dependencies,
        allTransitiveDependencies:
            SubjectAttendanceHistoryFamily._allTransitiveDependencies,
        subjectId: subjectId,
      );

  SubjectAttendanceHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subjectId,
  }) : super.internal();

  final int subjectId;

  @override
  Override overrideWith(
    Stream<List<AttendanceRecord>> Function(
      SubjectAttendanceHistoryRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubjectAttendanceHistoryProvider._internal(
        (ref) => create(ref as SubjectAttendanceHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subjectId: subjectId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<AttendanceRecord>> createElement() {
    return _SubjectAttendanceHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubjectAttendanceHistoryProvider &&
        other.subjectId == subjectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subjectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubjectAttendanceHistoryRef
    on AutoDisposeStreamProviderRef<List<AttendanceRecord>> {
  /// The parameter `subjectId` of this provider.
  int get subjectId;
}

class _SubjectAttendanceHistoryProviderElement
    extends AutoDisposeStreamProviderElement<List<AttendanceRecord>>
    with SubjectAttendanceHistoryRef {
  _SubjectAttendanceHistoryProviderElement(super.provider);

  @override
  int get subjectId => (origin as SubjectAttendanceHistoryProvider).subjectId;
}

String _$subjectAttendanceSummaryHash() =>
    r'68d49e86c827eecb1172c0b86d0cfcde094a3012';

/// See also [subjectAttendanceSummary].
@ProviderFor(subjectAttendanceSummary)
const subjectAttendanceSummaryProvider = AttendanceSummaryFamily();

/// See also [subjectAttendanceSummary].
class AttendanceSummaryFamily extends Family<AsyncValue<AttendanceSummary>> {
  /// See also [subjectAttendanceSummary].
  const AttendanceSummaryFamily();

  /// See also [subjectAttendanceSummary].
  AttendanceSummaryProvider call(int subjectId) {
    return AttendanceSummaryProvider(subjectId);
  }

  @override
  AttendanceSummaryProvider getProviderOverride(
    covariant AttendanceSummaryProvider provider,
  ) {
    return call(provider.subjectId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subjectAttendanceSummaryProvider';
}

/// See also [subjectAttendanceSummary].
class AttendanceSummaryProvider
    extends AutoDisposeStreamProvider<AttendanceSummary> {
  /// See also [subjectAttendanceSummary].
  AttendanceSummaryProvider(int subjectId)
    : this._internal(
        (ref) =>
            subjectAttendanceSummary(ref as AttendanceSummaryRef, subjectId),
        from: subjectAttendanceSummaryProvider,
        name: r'subjectAttendanceSummaryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$subjectAttendanceSummaryHash,
        dependencies: AttendanceSummaryFamily._dependencies,
        allTransitiveDependencies:
            AttendanceSummaryFamily._allTransitiveDependencies,
        subjectId: subjectId,
      );

  AttendanceSummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subjectId,
  }) : super.internal();

  final int subjectId;

  @override
  Override overrideWith(
    Stream<AttendanceSummary> Function(AttendanceSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AttendanceSummaryProvider._internal(
        (ref) => create(ref as AttendanceSummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subjectId: subjectId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<AttendanceSummary> createElement() {
    return _AttendanceSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendanceSummaryProvider && other.subjectId == subjectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subjectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AttendanceSummaryRef on AutoDisposeStreamProviderRef<AttendanceSummary> {
  /// The parameter `subjectId` of this provider.
  int get subjectId;
}

class _AttendanceSummaryProviderElement
    extends AutoDisposeStreamProviderElement<AttendanceSummary>
    with AttendanceSummaryRef {
  _AttendanceSummaryProviderElement(super.provider);

  @override
  int get subjectId => (origin as AttendanceSummaryProvider).subjectId;
}

String _$currentStudentProfileHash() =>
    r'2663647cdc1abbd1b12452a8d216af243c82ec6c';

/// See also [currentStudentProfile].
@ProviderFor(currentStudentProfile)
final currentStudentProfileProvider =
    AutoDisposeStreamProvider<StudentProfile?>.internal(
      currentStudentProfile,
      name: r'currentStudentProfileProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentStudentProfileHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentStudentProfileRef =
    AutoDisposeStreamProviderRef<StudentProfile?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
