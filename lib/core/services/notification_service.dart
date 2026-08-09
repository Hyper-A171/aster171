import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../database/aster_database.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  static const _firstReminderId = 5100;
  static const _lastReminderId = 5199;
  static const _firstTimetableReminderId = 5200;
  static const _lastTimetableReminderId = 5499;
  static const _firstSummaryReminderId = 5500;
  static const _lastSummaryReminderId = 5599;
  static const _firstNextPeriodReminderId = 5600;
  static const _lastNextPeriodReminderId = 5999;
  static const _firstAcademicReminderId = 6000;
  static const _lastAcademicReminderId = 6099;
  static const _channelId = 'aster_reminders';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    tz.initializeTimeZones();
    try {
      final timeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZone.identifier));
    } on Object {
      tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
    }

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('ic_notification'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await _plugin.initialize(settings: settings);
    _initialized = true;
  }

  Future<bool> requestPermission() async {
    await initialize();
    if (Platform.isAndroid) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.requestNotificationsPermission() ??
          false;
    }
    if (Platform.isIOS) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }
    return true;
  }

  Future<bool> notificationsEnabled() async {
    await initialize();
    if (Platform.isAndroid) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.areNotificationsEnabled() ??
          false;
    }
    return true;
  }

  Future<int> pendingReminderCount() async {
    await initialize();
    final pending = await _plugin.pendingNotificationRequests();
    return pending
        .where(
          (notification) =>
              notification.id >= _firstReminderId &&
              notification.id <= _lastAcademicReminderId,
        )
        .length;
  }

  Future<void> _cancelPendingRange(int firstId, int lastId) async {
    final pending = await _plugin.pendingNotificationRequests();
    for (final notification in pending) {
      if (notification.id >= firstId && notification.id <= lastId) {
        await _plugin.cancel(id: notification.id);
      }
    }
  }

  Future<bool> enableAndSync(AsterDatabase db) async {
    final granted = await requestPermission();
    if (!granted) return false;
    await syncAllReminders(db);
    return true;
  }

  Future<void> syncAllReminders(AsterDatabase db) async {
    if (!await notificationsEnabled()) return;

    final profile = await db.studentProfileDao.getProfile();
    if (profile == null) return;

    final leaveDays = await (db.select(
      db.weeklyPlanDays,
    )..where((day) => day.dayType.equals('plannedLeave'))).get();
    final excludedDates = leaveDays
        .map((day) => '${day.date.year}-${day.date.month}-${day.date.day}')
        .toSet();

    final requirement =
        await (db.select(db.internshipRequirements)
              ..where((table) => table.studentProfileId.equals(profile.id))
              ..limit(1))
            .getSingleOrNull();
    if (requirement?.internshipStartDate != null &&
        requirement?.internshipEndDate != null) {
      final availability =
          await (db.select(db.internshipAvailability)..where(
                (table) =>
                    table.internshipRequirementId.equals(requirement!.id),
              ))
              .get();
      final weekdays = availability
          .where((day) => day.isAvailable)
          .map((day) => day.weekday)
          .toSet();
      await syncInternshipReminders(
        startDate: requirement!.internshipStartDate!,
        endDate: requirement.internshipEndDate!,
        weekdays: weekdays.isEmpty ? const {1, 2, 3} : weekdays,
        startMinutes: requirement.startMinutes,
        excludedDates: excludedDates,
      );
    }

    await syncTimetableReminders(db, endDate: profile.semesterEndDate);
    await syncAcademicCalendarReminders(db);
  }

  Future<void> syncAcademicCalendarReminders(AsterDatabase db) async {
    await initialize();
    await _cancelPendingRange(
      _firstAcademicReminderId,
      _lastAcademicReminderId,
    );

    final fallbackEvents = <({DateTime date, String title, String body})>[
      (
        date: DateTime(2026, 8, 10),
        title: 'Semester 5 college begins tomorrow',
        body: 'Your college-specific Semester 5 schedule starts on 10 August.',
      ),
      (
        date: DateTime(2026, 8, 20),
        title: 'Exam form window opens tomorrow',
        body: 'Normal-fee candidate form filling runs from 20–30 August.',
      ),
      (
        date: DateTime(2026, 8, 30),
        title: 'Exam form deadline tomorrow',
        body: '30 August is the final normal-fee candidate form date.',
      ),
      (
        date: DateTime(2026, 9, 1),
        title: 'Late-fee form window opens tomorrow',
        body: 'Late-fee candidate form filling runs from 1–3 September.',
      ),
      (
        date: DateTime(2026, 9, 5),
        title: 'Penalty form window opens tomorrow',
        body: 'Penalty-fee candidate form filling runs from 5–6 September.',
      ),
      (
        date: DateTime(2026, 9, 21),
        title: 'First class test starts tomorrow',
        body: 'The MSBTE first class-test window is 21–22 September.',
      ),
      (
        date: DateTime(2026, 10, 12),
        title: 'Second class test starts tomorrow',
        body: 'The MSBTE second class-test window is 12–14 October.',
      ),
      (
        date: DateTime(2026, 10, 17),
        title: 'Semester 5 term ends tomorrow',
        body:
            'The MSBTE 2026–27 odd-semester academic term ends on 17 October.',
      ),
    ];

    final storedEvents = await db.select(db.academicCalendarEvents).get()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    final events = storedEvents.isEmpty
        ? fallbackEvents
        : storedEvents
              .map(
                (event) => (
                  date: event.startDate,
                  title: 'Tomorrow: ${event.title}',
                  body:
                      event.description ??
                      'Open Aster to review this academic event.',
                ),
              )
              .toList();

    final now = tz.TZDateTime.now(tz.local);
    var id = _firstAcademicReminderId;
    for (final event in events) {
      final reminderDay = event.date.subtract(const Duration(days: 1));
      final scheduled = tz.TZDateTime(
        tz.local,
        reminderDay.year,
        reminderDay.month,
        reminderDay.day,
        18,
      );
      if (!scheduled.isAfter(now) || id > _lastAcademicReminderId) continue;
      await _plugin.zonedSchedule(
        id: id++,
        title: event.title,
        body: event.body,
        scheduledDate: scheduled,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            'Aster reminders',
            channelDescription: 'Attendance and academic calendar reminders',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: 'academic_calendar',
      );
    }
  }

  Future<void> syncInternshipReminders({
    required DateTime startDate,
    required DateTime endDate,
    required Set<int> weekdays,
    int? startMinutes,
    Set<String> excludedDates = const {},
  }) async {
    await initialize();
    await _cancelPendingRange(_firstReminderId, _lastReminderId);

    final now = tz.TZDateTime.now(tz.local);
    var date = DateTime(startDate.year, startDate.month, startDate.day);
    final lastDate = DateTime(endDate.year, endDate.month, endDate.day);
    var id = _firstReminderId;

    while (!date.isAfter(lastDate) && id <= _lastReminderId) {
      final dateKey = '${date.year}-${date.month}-${date.day}';
      if (weekdays.contains(date.weekday) && !excludedDates.contains(dateKey)) {
        final reminderMinutes = ((startMinutes ?? 9 * 60) - 30).clamp(
          0,
          23 * 60 + 59,
        );
        final scheduledDate = tz.TZDateTime(
          tz.local,
          date.year,
          date.month,
          date.day,
        ).add(Duration(minutes: reminderMinutes));
        if (scheduledDate.isAfter(now)) {
          await _plugin.zonedSchedule(
            id: id++,
            title: 'Internship today',
            body:
                'Today is one of your selected internship days. Complete at least 3 days this week.',
            scheduledDate: scheduledDate,
            notificationDetails: const NotificationDetails(
              android: AndroidNotificationDetails(
                _channelId,
                'Aster reminders',
                channelDescription: 'Attendance and internship reminders',
                importance: Importance.high,
                priority: Priority.high,
              ),
              iOS: DarwinNotificationDetails(),
            ),
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
            payload: 'internship',
          );
        }
      }
      date = date.add(const Duration(days: 1));
    }
  }

  Future<void> syncTimetableReminders(
    AsterDatabase db, {
    DateTime? endDate,
  }) async {
    await initialize();
    await _cancelPendingRange(
      _firstTimetableReminderId,
      _lastNextPeriodReminderId,
    );

    final entries = await db.select(db.timetableEntries).get();
    if (entries.isEmpty) return;

    final plannedLeaveDays = await (db.select(
      db.weeklyPlanDays,
    )..where((day) => day.dayType.equals('plannedLeave'))).get();
    final excludedDates = plannedLeaveDays
        .map((day) => '${day.date.year}-${day.date.month}-${day.date.day}')
        .toSet();

    final now = tz.TZDateTime.now(tz.local);
    var date = DateTime(now.year, now.month, now.day);
    final configuredEnd = endDate == null
        ? date.add(const Duration(days: 60))
        : DateTime(endDate.year, endDate.month, endDate.day);
    final lastDate = configuredEnd.isBefore(date) ? date : configuredEnd;
    final subjectNames = <int, String>{};
    for (final entry in entries) {
      if (subjectNames.containsKey(entry.subjectId)) continue;
      final subject =
          await (db.select(db.subjects)
                ..where((table) => table.id.equals(entry.subjectId))
                ..limit(1))
              .getSingleOrNull();
      subjectNames[entry.subjectId] = subject?.name ?? 'College class';
    }

    var classReminderId = _firstTimetableReminderId;
    var summaryReminderId = _firstSummaryReminderId;
    var nextPeriodReminderId = _firstNextPeriodReminderId;

    while (!date.isAfter(lastDate)) {
      final dateKey = '${date.year}-${date.month}-${date.day}';
      if (excludedDates.contains(dateKey)) {
        date = date.add(const Duration(days: 1));
        continue;
      }
      final dayEntries =
          entries.where((item) => item.weekday == date.weekday).toList()
            ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));
      if (dayEntries.isNotEmpty &&
          summaryReminderId <= _lastSummaryReminderId) {
        final summaryDate = tz.TZDateTime(
          tz.local,
          date.year,
          date.month,
          date.day,
          20,
        ).subtract(const Duration(days: 1));
        if (summaryDate.isAfter(now)) {
          final names = dayEntries
              .map((entry) => subjectNames[entry.subjectId]!)
              .toSet()
              .join(', ');
          await _plugin.zonedSchedule(
            id: summaryReminderId++,
            title: 'Tomorrow: ${dayEntries.length} college periods',
            body: names,
            scheduledDate: summaryDate,
            notificationDetails: const NotificationDetails(
              android: AndroidNotificationDetails(
                _channelId,
                'Aster reminders',
                channelDescription: 'Attendance and internship reminders',
                importance: Importance.high,
                priority: Priority.high,
              ),
              iOS: DarwinNotificationDetails(),
            ),
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
            payload: 'tomorrow_timetable',
          );
        }
      }

      for (var index = 0; index < dayEntries.length; index++) {
        final entry = dayEntries[index];
        if (classReminderId > _lastTimetableReminderId) break;
        final reminderMinutes = entry.startMinutes - 30;
        final scheduledDate = tz.TZDateTime(
          tz.local,
          date.year,
          date.month,
          date.day,
        ).add(Duration(minutes: reminderMinutes));
        final subjectName = subjectNames[entry.subjectId]!;

        if (scheduledDate.isAfter(now)) {
          final startHour = entry.startMinutes ~/ 60;
          final startMinute = entry.startMinutes % 60;
          await _plugin.zonedSchedule(
            id: classReminderId++,
            title: '$subjectName in 30 minutes',
            body:
                'Class starts at ${_formatTime(startHour, startMinute)}. Attendance minimum: 75%.',
            scheduledDate: scheduledDate,
            notificationDetails: const NotificationDetails(
              android: AndroidNotificationDetails(
                _channelId,
                'Aster reminders',
                channelDescription: 'Attendance and internship reminders',
                importance: Importance.high,
                priority: Priority.high,
              ),
              iOS: DarwinNotificationDetails(),
            ),
            androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
            payload: 'timetable',
          );
        }

        if (index + 1 < dayEntries.length &&
            nextPeriodReminderId <= _lastNextPeriodReminderId) {
          final nextEntry = dayEntries[index + 1];
          final nextReminderDate = tz.TZDateTime(
            tz.local,
            date.year,
            date.month,
            date.day,
          ).add(Duration(minutes: entry.endMinutes));
          if (nextReminderDate.isAfter(now)) {
            final nextName = subjectNames[nextEntry.subjectId]!;
            await _plugin.zonedSchedule(
              id: nextPeriodReminderId++,
              title: 'Next period: $nextName',
              body:
                  'Starts at ${_formatTime(nextEntry.startMinutes ~/ 60, nextEntry.startMinutes % 60)}.',
              scheduledDate: nextReminderDate,
              notificationDetails: const NotificationDetails(
                android: AndroidNotificationDetails(
                  _channelId,
                  'Aster reminders',
                  channelDescription: 'Attendance and internship reminders',
                  importance: Importance.high,
                  priority: Priority.high,
                ),
                iOS: DarwinNotificationDetails(),
              ),
              androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
              payload: 'next_period',
            );
          }
        }
      }
      date = date.add(const Duration(days: 1));
    }
  }

  String _formatTime(int hour, int minute) {
    final period = hour < 12 ? 'AM' : 'PM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  Future<void> showTestReminder() async {
    await initialize();
    await _plugin.show(
      id: 5001,
      title: 'Aster reminders are working',
      body: 'You will be reminded on your selected flexible internship days.',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          'Aster reminders',
          channelDescription: 'Attendance and internship reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}
