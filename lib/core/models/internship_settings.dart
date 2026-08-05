import 'package:flutter/material.dart';

class InternshipSettings {
  final int requiredDays;
  final bool isFlexible;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool allowHalfDays;

  InternshipSettings({
    required this.requiredDays,
    required this.isFlexible,
    required this.startTime,
    required this.endTime,
    required this.allowHalfDays,
  });

  Map<String, dynamic> toMap() {
    return {
      'requiredDays': requiredDays,
      'isFlexible': isFlexible ? 1 : 0,
      'startTime': '${startTime.hour}:${startTime.minute}',
      'endTime': '${endTime.hour}:${endTime.minute}',
      'allowHalfDays': allowHalfDays ? 1 : 0,
    };
  }

  factory InternshipSettings.fromMap(Map<String, dynamic> map) {
    final startParts = (map['startTime'] as String).split(':');
    final endParts = (map['endTime'] as String).split(':');

    return InternshipSettings(
      requiredDays: map['requiredDays'],
      isFlexible: map['isFlexible'] == 1,
      startTime: TimeOfDay(
        hour: int.parse(startParts[0]),
        minute: int.parse(startParts[1]),
      ),
      endTime: TimeOfDay(
        hour: int.parse(endParts[0]),
        minute: int.parse(endParts[1]),
      ),
      allowHalfDays: map['allowHalfDays'] == 1,
    );
  }
}
