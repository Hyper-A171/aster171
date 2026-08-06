import '../database/aster_database.dart';
import '../database/daos/timetable_dao.dart';

class TimetableRepository {
  final TimetableDao _timetableDao;

  TimetableRepository(this._timetableDao);

  Stream<List<TimetableEntry>> watchTimetable(int subjectId) =>
      _timetableDao.watchTimetable(subjectId);

  Future<int> addEntry(TimetableEntriesCompanion entry) =>
      _timetableDao.insertEntry(entry);

  Future deleteEntry(int id) => _timetableDao.deleteEntry(id);
}
