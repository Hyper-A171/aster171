import 'package:drift/drift.dart';
import '../aster_database.dart';

part 'subjects_dao.g.dart';

@DriftAccessor(tables: [Subjects])
class SubjectsDao extends DatabaseAccessor<AsterDatabase>
    with _$SubjectsDaoMixin {
  SubjectsDao(super.db);

  Stream<List<Subject>> watchActiveSubjects() {
    return (select(subjects)..where((t) => t.isArchived.equals(false))).watch();
  }

  Stream<Subject> watchSubjectById(int id) {
    return (select(subjects)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future<int> insertSubject(SubjectsCompanion subject) =>
      into(subjects).insert(subject);

  Future updateSubject(SubjectsCompanion subject) =>
      update(subjects).replace(subject);

  Future archiveSubject(int id) {
    return (update(subjects)..where((t) => t.id.equals(id))).write(
      const SubjectsCompanion(isArchived: Value(true)),
    );
  }

  Future deleteSubject(int id) =>
      (delete(subjects)..where((t) => t.id.equals(id))).go();
}
