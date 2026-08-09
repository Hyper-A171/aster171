import '../database/aster_database.dart';
import '../database/daos/attendance_dao.dart';
import '../models/attendance_summary.dart';

class AttendanceRepository {
  final AttendanceDao _attendanceDao;

  AttendanceRepository(this._attendanceDao);

  Stream<List<AttendanceRecord>> watchAttendanceHistory(int subjectId) =>
      _attendanceDao.watchAttendanceHistory(subjectId);

  Stream<AttendanceSummary> watchSubjectAttendanceSummary(int subjectId) =>
      _attendanceDao.watchSubjectAttendanceSummary(subjectId);

  Future<void> markAttendance({
    required int subjectId,
    required int lectureSessionId,
    required String status, // present, absent, cancelled, pending, excused
    double countedUnits = 1.0,
    double attendedUnits = 0.0,
    String? notes,
  }) async {
    return _attendanceDao.markAttendanceTransaction(
      lectureSessionId: lectureSessionId,
      subjectId: subjectId,
      status: status,
      countedUnits: countedUnits,
      attendedUnits: attendedUnits,
      notes: notes,
    );
  }

  Future<void> correctAttendance({
    required int attendanceRecordId,
    required String newStatus,
    required double newCountedUnits,
    required double newAttendedUnits,
  }) async {
    return _attendanceDao.correctOrDeleteAttendanceTransaction(
      attendanceRecordId: attendanceRecordId,
      newStatus: newStatus,
      newCountedUnits: newCountedUnits,
      newAttendedUnits: newAttendedUnits,
    );
  }
}
