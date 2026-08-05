enum SubjectType { theory, practical }

class Subject {
  final int? id;
  final String title;
  final String code;
  final int units;
  final bool isMandatory;
  final SubjectType type;
  final double minAttendance;
  final double targetAttendance;

  Subject({
    this.id,
    required this.title,
    required this.code,
    required this.units,
    required this.isMandatory,
    required this.type,
    required this.minAttendance,
    required this.targetAttendance,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'units': units,
      'isMandatory': isMandatory ? 1 : 0,
      'type': type.name,
      'minAttendance': minAttendance,
      'targetAttendance': targetAttendance,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'],
      title: map['title'],
      code: map['code'],
      units: map['units'],
      isMandatory: map['isMandatory'] == 1,
      type: SubjectType.values.byName(map['type']),
      minAttendance: map['minAttendance'],
      targetAttendance: map['targetAttendance'],
    );
  }
}
