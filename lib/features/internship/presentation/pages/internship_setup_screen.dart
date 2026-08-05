import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/fields/aster_time_field.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import 'package:aster/features/subjects/presentation/pages/add_subjects_screen.dart';

class InternshipSetupScreen extends ConsumerStatefulWidget {
  const InternshipSetupScreen({super.key});

  @override
  ConsumerState<InternshipSetupScreen> createState() =>
      _InternshipSetupScreenState();
}

class _InternshipSetupScreenState extends ConsumerState<InternshipSetupScreen> {
  int _requiredDays = 3;
  bool _isFlexible = true;
  final List<String> _days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final Set<int> _selectedDays = {1, 2, 3, 4, 5};
  TimeOfDay? _startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay? _endTime = const TimeOfDay(hour: 17, minute: 0);
  bool _allowHalfDays = true;
  bool _isSaving = false;

  Future<void> _onContinue() async {
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

      if (mounted) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const AddSubjectsScreen()));
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
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text('Step 3 of 5', style: context.asterTextTheme.labelSmall),
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
                          style: context.asterTextTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Per week',
                          style: context.asterTextTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: context.colorScheme.outlineVariant,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => setState(
                              () => _requiredDays = (_requiredDays > 1
                                  ? _requiredDays - 1
                                  : 1),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$_requiredDays',
                            style: context.asterTextTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: context.colorScheme.primary,
                                ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => setState(
                              () => _requiredDays = (_requiredDays < 7
                                  ? _requiredDays + 1
                                  : 7),
                            ),
                          ),
                        ],
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
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildToggleButton(
                            context,
                            'Flexible Days',
                            _isFlexible,
                            () => setState(() => _isFlexible = true),
                          ),
                        ),
                        Expanded(
                          child: _buildToggleButton(
                            context,
                            'Fixed Days',
                            !_isFlexible,
                            () => setState(() => _isFlexible = false),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Select days you can work',
                    style: context.asterTextTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(_days.length, (index) {
                      final isSelected = _selectedDays.contains(index);
                      return GestureDetector(
                        onTap: () => setState(
                          () => isSelected
                              ? _selectedDays.remove(index)
                              : _selectedDays.add(index),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.colorScheme.primary
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: isSelected
                                ? null
                                : Border.all(
                                    color: context.colorScheme.outlineVariant,
                                  ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _days[index],
                            style: context.asterTextTheme.titleSmall?.copyWith(
                              color: isSelected
                                  ? context.colorScheme.onPrimary
                                  : context.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.bold,
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
                    onChanged: (val) => setState(() => _allowHalfDays = val),
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            AsterPrimaryButton(
              label: 'Continue',
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

  Widget _buildToggleButton(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.asterTextTheme.labelLarge?.copyWith(
            color: isSelected
                ? context.colorScheme.onSurface
                : context.colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
