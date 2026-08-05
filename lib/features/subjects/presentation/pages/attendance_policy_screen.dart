import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../app/theme/aster_typography.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/fields/aster_text_field.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import 'package:aster/features/internship/presentation/pages/internship_setup_screen.dart';

class AttendancePolicyScreen extends ConsumerStatefulWidget {
  const AttendancePolicyScreen({super.key});

  @override
  ConsumerState<AttendancePolicyScreen> createState() =>
      _AttendancePolicyScreenState();
}

class _AttendancePolicyScreenState
    extends ConsumerState<AttendancePolicyScreen> {
  final _minAttendanceController = TextEditingController(text: '75');
  final _targetAttendanceController = TextEditingController(text: '80');
  bool _isSaving = false;

  Future<void> _onContinue() async {
    setState(() => _isSaving = true);

    try {
      final profile = await ref.read(currentStudentProfileProvider.future);
      if (profile == null) {
        throw Exception(
          'Student profile not found. Please complete basic info.',
        );
      }

      final repository = ref.read(attendancePolicyRepositoryProvider);
      await repository.savePolicy(
        AttendancePoliciesCompanion(
          studentProfileId: drift.Value(profile.id),
          requiredPercentage: drift.Value(
            double.tryParse(_minAttendanceController.text) ?? 75.0,
          ),
          safetyTargetPercentage: drift.Value(
            double.tryParse(_targetAttendanceController.text) ?? 80.0,
          ),
        ),
      );

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const InternshipSetupScreen()),
        );
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
      appBar: AppBar(title: const Text('Attendance Policy')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Step 2
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
            Text('Step 2 of 5', style: context.asterTextTheme.labelSmall),
            const SizedBox(height: AsterSpacing.spaceLg),

            Text(
              'Attendance Policy',
              style: context.asterTextTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "Set your university's minimum requirement and a personal safety buffer.",
              style: context.asterTextTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AsterTextField(
                      label: 'Minimum Required Attendance',
                      controller: _minAttendanceController,
                      hintText: '75',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('%'),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: AsterSpacing.spaceXl),
                    AsterTextField(
                      label: 'Personal Safety Target',
                      controller: _targetAttendanceController,
                      hintText: '80',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('%'),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.secondaryContainer.withValues(
                  alpha: 0.15,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.secondaryContainer.withValues(
                    alpha: 0.3,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.security, color: context.colorScheme.secondary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The 5% Safety Buffer',
                          style: context.asterTextTheme.titleSmall,
                        ),
                        Text(
                          'Setting a personal target slightly higher than the minimum gives you breathing room.',
                          style: context.asterTextTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            AsterPrimaryButton(
              label: 'Continue',
              icon: const Icon(Icons.arrow_forward),
              isLoading: _isSaving,
              onPressed: _onContinue,
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
