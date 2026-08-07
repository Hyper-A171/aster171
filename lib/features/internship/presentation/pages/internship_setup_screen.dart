import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/fields/aster_time_field.dart';
import '../../../../core/widgets/fields/aster_date_field.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/services/notification_service.dart';
import 'package:aster/features/subjects/presentation/pages/add_subjects_screen.dart';

class InternshipSetupScreen extends ConsumerStatefulWidget {
  const InternshipSetupScreen({super.key, this.isOnboarding = false});

  final bool isOnboarding;

  @override
  ConsumerState<InternshipSetupScreen> createState() =>
      _InternshipSetupScreenState();
}

class _InternshipSetupScreenState extends ConsumerState<InternshipSetupScreen> {
  int _requiredDays = 3;
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final Set<int> _selectedDays = {3, 4, 5};
  TimeOfDay? _startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay? _endTime = const TimeOfDay(hour: 17, minute: 0);
  bool _allowHalfDays = false;
  bool _isSaving = false;
  bool _isLoading = true;
  DateTime? _internshipStartDate = DateTime(2026, 6, 1);
  DateTime? _internshipEndDate = DateTime(2026, 8, 29);

  @override
  void initState() {
    super.initState();
    _loadExistingSettings();
  }

  Future<void> _loadExistingSettings() async {
    try {
      final profile = await ref.read(currentStudentProfileProvider.future);
      if (profile == null) return;
      final db = ref.read(databaseProvider);
      final requirement =
          await (db.select(db.internshipRequirements)
                ..where((table) => table.studentProfileId.equals(profile.id))
                ..limit(1))
              .getSingleOrNull();
      if (requirement == null) return;

      final availability =
          await (db.select(db.internshipAvailability)..where(
                (table) => table.internshipRequirementId.equals(requirement.id),
              ))
              .get();
      if (!mounted) return;
      setState(() {
        _requiredDays = 3;
        _allowHalfDays = false;
        _internshipStartDate = requirement.internshipStartDate;
        _internshipEndDate = requirement.internshipEndDate;
        if (requirement.startMinutes != null) {
          _startTime = TimeOfDay(
            hour: requirement.startMinutes! ~/ 60,
            minute: requirement.startMinutes! % 60,
          );
        }
        if (requirement.endMinutes != null) {
          _endTime = TimeOfDay(
            hour: requirement.endMinutes! ~/ 60,
            minute: requirement.endMinutes! % 60,
          );
        }
        final availableDays = availability
            .where((day) => day.isAvailable && day.weekday <= 6)
            .map((day) => day.weekday - 1)
            .toSet();
        if (availableDays.isNotEmpty) {
          _selectedDays
            ..clear()
            ..addAll(availableDays);
        }
      });

      if (_internshipStartDate != null && _internshipEndDate != null) {
        await NotificationService.instance.syncInternshipReminders(
          startDate: _internshipStartDate!,
          endDate: _internshipEndDate!,
          weekdays: _selectedDays.map((index) => index + 1).toSet(),
          startMinutes: _startTime == null
              ? null
              : _startTime!.hour * 60 + _startTime!.minute,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _onContinue() async {
    if (_selectedDays.length < _requiredDays) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Select at least 3 internship days from Monday to Saturday.',
          ),
        ),
      );
      return;
    }
    if (_startTime == null ||
        _endTime == null ||
        _endTime!.hour * 60 + _endTime!.minute <=
            _startTime!.hour * 60 + _startTime!.minute) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('End time must be after start time.')),
      );
      return;
    }
    if (_internshipStartDate == null ||
        _internshipEndDate == null ||
        _internshipEndDate!.isBefore(_internshipStartDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Choose a valid internship date range.')),
      );
      return;
    }
    setState(() => _isSaving = true);

    try {
      final profile = await ref.read(currentStudentProfileProvider.future);
      if (profile == null) throw Exception('Profile not found');

      final db = ref.read(databaseProvider);

      await db.transaction(() async {
        final reqId = await db.internshipDao.upsertRequirements(
          InternshipRequirementsCompanion(
            studentProfileId: drift.Value(profile.id),
            requiredDaysPerWeek: drift.Value(_requiredDays),
            requiredHoursPerWeek: const drift.Value(40),
            internshipStartDate: drift.Value(_internshipStartDate),
            internshipEndDate: drift.Value(_internshipEndDate),
            courseCode: const drift.Value('315004'),
            allowsHalfDay: drift.Value(_allowHalfDays),
            startMinutes: drift.Value(
              _startTime!.hour * 60 + _startTime!.minute,
            ),
            endMinutes: drift.Value(_endTime!.hour * 60 + _endTime!.minute),
          ),
        );

        // Delete old availability and insert new
        await (db.delete(
          db.internshipAvailability,
        )..where((t) => t.internshipRequirementId.equals(reqId))).go();

        for (int i = 0; i < 7; i++) {
          await db
              .into(db.internshipAvailability)
              .insert(
                InternshipAvailabilityCompanion.insert(
                  internshipRequirementId: reqId,
                  weekday: i + 1,
                  isAvailable: drift.Value(_selectedDays.contains(i)),
                  isFixed: const drift.Value(false),
                ),
              );
        }
      });

      if (_internshipStartDate != null && _internshipEndDate != null) {
        await NotificationService.instance.syncInternshipReminders(
          startDate: _internshipStartDate!,
          endDate: _internshipEndDate!,
          weekdays: _selectedDays.map((index) => index + 1).toSet(),
          startMinutes: _startTime!.hour * 60 + _startTime!.minute,
        );
      }

      if (mounted) {
        if (widget.isOnboarding) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AddSubjectsScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Internship settings updated.')),
          );
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internship Settings'),
        actions: widget.isOnboarding
            ? null
            : [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: context.sideMargin,
                vertical: AsterSpacing.spaceLg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.isOnboarding) ...[
                    // Progress Step 3
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Container(
                            height: 4,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Container(
                            height: 4,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Container(
                            height: 4,
                            color: context.colorScheme.surfaceContainerHighest,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Container(
                            height: 4,
                            color: context.colorScheme.surfaceContainerHighest,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AsterSpacing.spaceMd),
                    Text(
                      'Step 3 of 5',
                      style: context.asterTextTheme.labelSmall,
                    ),
                    const SizedBox(height: AsterSpacing.spaceLg),
                  ],

                  _buildSection(
                    context,
                    title: 'MSBTE Internship (315004)',
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AsterDateField(
                                label: 'Start Date',
                                value: _internshipStartDate,
                                onDateSelected: (date) =>
                                    setState(() => _internshipStartDate = date),
                              ),
                            ),
                            const SizedBox(width: AsterSpacing.spaceMd),
                            Expanded(
                              child: AsterDateField(
                                label: 'End Date',
                                value: _internshipEndDate,
                                onDateSelected: (date) =>
                                    setState(() => _internshipEndDate = date),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AsterSpacing.spaceSm),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '12 weeks • 40 notional hours/week',
                            style: context.asterTextTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceLg),

                  // Commitment Section
                  _buildSection(
                    context,
                    title: 'Commitment',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Required Days',
                                style: context.asterTextTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Per week',
                                style: context.asterTextTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          context.colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: context.colorScheme.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: context.colorScheme.outlineVariant,
                              ),
                            ),
                            child: Text(
                              'Minimum $_requiredDays days',
                              style: context.asterTextTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: context.colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceLg),

                  // Availability Section
                  _buildSection(
                    context,
                    title: 'Availability Pattern',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flexible schedule: choose any 3 or more days. Sunday is excluded.',
                          style: context.asterTextTheme.labelSmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: List.generate(_days.length, (index) {
                            final isSelected = _selectedDays.contains(index);
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      if (_selectedDays.length >
                                          _requiredDays) {
                                        _selectedDays.remove(index);
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'At least 3 internship days are required.',
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      _selectedDays.add(index);
                                    }
                                  });
                                },
                                child: Center(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? context.colorScheme.primary
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: isSelected
                                          ? null
                                          : Border.all(
                                              color: context
                                                  .colorScheme
                                                  .outlineVariant,
                                            ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      _days[index],
                                      style: context.asterTextTheme.titleSmall
                                          ?.copyWith(
                                            color: isSelected
                                                ? context.colorScheme.onPrimary
                                                : context
                                                      .colorScheme
                                                      .onSurfaceVariant,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const Divider(height: 48),
                        Row(
                          children: [
                            Expanded(
                              child: AsterTimeField(
                                label: 'Start Time',
                                value: _startTime,
                                onTimeSelected: (time) =>
                                    setState(() => _startTime = time),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: AsterTimeField(
                                label: 'End Time',
                                value: _endTime,
                                onTimeSelected: (time) =>
                                    setState(() => _endTime = time),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SwitchListTile(
                          title: Text(
                            'Allow Half Days',
                            style: context.asterTextTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Can split hours across days',
                            style: context.asterTextTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          value: _allowHalfDays,
                          onChanged: (value) =>
                              setState(() => _allowHalfDays = value),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceXl),

                  AsterPrimaryButton(
                    label: widget.isOnboarding ? 'Continue' : 'Save Changes',
                    isLoading: _isSaving,
                    onPressed: _onContinue,
                    fullWidth: true,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.asterTextTheme.titleSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
