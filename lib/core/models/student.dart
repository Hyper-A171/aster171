class Student {
  final String name;
  final String college;
  final String course;
  final int semester;
  final DateTime startDate;
  final DateTime endDate;

  Student({
    required this.name,
    required this.college,
    required this.course,
    required this.semester,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'college': college,
      'course': course,
      'semester': semester,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      college: map['college'],
      course: map['course'],
      semester: map['semester'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
    );
  }
}
