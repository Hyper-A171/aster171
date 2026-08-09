class TimetableImportEntry {
  const TimetableImportEntry({
    required this.subjectName,
    required this.courseCode,
    required this.teacherName,
    required this.weekday,
    required this.startMinutes,
    required this.endMinutes,
  });

  final String subjectName;
  final String courseCode;
  final String teacherName;
  final int weekday;
  final int startMinutes;
  final int endMinutes;

  factory TimetableImportEntry.fromJson(Map<String, dynamic> json) {
    return TimetableImportEntry(
      subjectName: (json['subject_name'] as String? ?? '').trim(),
      courseCode: (json['course_code'] as String? ?? '').trim(),
      teacherName: (json['teacher_name'] as String? ?? '').trim(),
      weekday: (json['weekday'] as num).toInt(),
      startMinutes: (json['start_minutes'] as num).toInt(),
      endMinutes: (json['end_minutes'] as num).toInt(),
    );
  }
}
