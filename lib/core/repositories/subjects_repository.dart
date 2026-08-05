import '../database/aster_database.dart';
import '../database/daos/subjects_dao.dart';

class SubjectsRepository {
  final SubjectsDao _subjectsDao;

  SubjectsRepository(this._subjectsDao);

  Stream<List<Subject>> watchActiveSubjects() =>
      _subjectsDao.watchActiveSubjects();

  Stream<Subject> watchSubjectById(int id) => _subjectsDao.watchSubjectById(id);

  Future<int> addSubject(SubjectsCompanion subject) =>
      _subjectsDao.insertSubject(subject);

  Future updateSubject(SubjectsCompanion subject) =>
      _subjectsDao.updateSubject(subject);

  Future archiveSubject(int id) => _subjectsDao.archiveSubject(id);

  Future deleteSubject(int id) => _subjectsDao.deleteSubject(id);
}
