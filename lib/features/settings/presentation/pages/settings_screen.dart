import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aster/app/theme/aster_spacing.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/core/responsive/responsive_layout.dart';
import 'package:aster/app/theme/theme_mode_controller.dart';
import 'package:aster/core/widgets/layout/aster_section_header.dart';
import 'package:aster/core/providers/database_providers.dart';
import 'package:aster/features/profile/presentation/pages/profile_screen.dart';
import 'package:aster/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:aster/features/subjects/presentation/pages/attendance_policy_screen.dart';
import 'package:aster/features/internship/presentation/pages/internship_setup_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentStudentProfileProvider);
    final profile = profileAsync.value;

    return Scaffold(
      appBar: AppBar(title: const Text('More & Settings')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        children: [
          // Student Profile Summary Header
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: context.colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: context.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.person,
                      size: 28,
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile?.name ?? 'Student Profile',
                          style: context.asterTextTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          profile?.collegeName ??
                              'Tap to manage account & profile details',
                          style: context.asterTextTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: context.colorScheme.outlineVariant,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AsterSpacing.spaceLg),

          const AsterSectionHeader(title: 'Account & Preferences'),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Edit Profile'),
            subtitle: const Text('Name, college, and semester timeline'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none),
            title: const Text('Notifications & Reminders'),
            subtitle: const Text('View live attendance alerts and warnings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NotificationsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme Mode'),
            subtitle: ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeModeController.instance,
              builder: (context, mode, _) => Text(mode.name.toUpperCase()),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => ThemeModeController.instance.toggleTheme(),
          ),
          const Divider(height: 32),

          const AsterSectionHeader(title: 'Curriculum & Internship Setup'),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Attendance Policy Thresholds'),
            subtitle: const Text(
              'Configure minimum (75%) & safety target (80%)',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AttendancePolicyScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.work_outline),
            title: const Text('Internship Schedule & Days'),
            subtitle: const Text('Configure weekly field day requirements'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const InternshipSetupScreen(),
                ),
              );
            },
          ),
          const Divider(height: 32),

          const AsterSectionHeader(title: 'Data & Database'),
          ListTile(
            leading: const Icon(Icons.delete_sweep_outlined, color: Colors.red),
            title: const Text(
              'Reset Application Database',
              style: TextStyle(color: Colors.red),
            ),
            subtitle: const Text(
              'Clear all local subjects, sessions, and history',
            ),
            onTap: () => _showResetConfirmDialog(context, ref),
          ),
        ],
      ),
    );
  }

  void _showResetConfirmDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset Database?'),
          content: const Text(
            'This action will permanently delete all subjects, attendance records, and setup data stored in SQLite. Are you sure?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                final db = ref.read(databaseProvider);
                await db.transaction(() async {
                  await db.delete(db.attendanceRecords).go();
                  await db.delete(db.lectureSessions).go();
                  await db.delete(db.timetableEntries).go();
                  await db.delete(db.subjects).go();
                  await db.delete(db.internshipSessions).go();
                  await db.delete(db.internshipAvailability).go();
                  await db.delete(db.internshipRequirements).go();
                });
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Database reset successfully.'),
                    ),
                  );
                }
              },
              child: const Text('Reset All Data'),
            ),
          ],
        );
      },
    );
  }
}
