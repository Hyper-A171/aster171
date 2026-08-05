enum AttendanceStatus { present, absent, canceled }

class AttendanceRecord {
  final int? id;
  final int subjectId;
  final DateTime date;
  final AttendanceStatus status;

  AttendanceRecord({
    this.id,
    required this.subjectId,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectId': subjectId,
      'date': date.toIso8601String(),
      'status': status.name,
    };
  }

  factory AttendanceRecord.fromMap(Map<String, dynamic> map) {
    return AttendanceRecord(
      id: map['id'],
      subjectId: map['subjectId'],
      date: DateTime.parse(map['date']),
      status: AttendanceStatus.values.byName(map['status']),
    );
  }
}
