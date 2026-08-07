import '../database/aster_database.dart';
import '../database/daos/timetable_dao.dart';
import '../services/notification_service.dart';

class TimetableRepository {
  final TimetableDao _timetableDao;
  final AsterDatabase _database;

  TimetableRepository(this._timetableDao, this._database);

  Stream<List<TimetableEntry>> watchTimetable(int subjectId) =>
      _timetableDao.watchTimetable(subjectId);

  Future<int> addEntry(TimetableEntriesCompanion entry) async {
    final id = await _timetableDao.insertEntry(entry);
    await NotificationService.instance.syncAllReminders(_database);
    return id;
  }

  Future<void> deleteEntry(int id) async {
    await _timetableDao.deleteEntry(id);
    await NotificationService.instance.syncAllReminders(_database);
  }
}
