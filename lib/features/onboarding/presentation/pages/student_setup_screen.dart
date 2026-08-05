import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../app/theme/aster_typography.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/buttons/aster_secondary_button.dart';
import '../../../../core/widgets/fields/aster_date_field.dart';
import '../../../../core/widgets/fields/aster_dropdown_field.dart';
import '../../../../core/widgets/fields/aster_text_field.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import 'package:aster/features/subjects/presentation/pages/attendance_policy_screen.dart';

class StudentSetupScreen extends ConsumerStatefulWidget {
  const StudentSetupScreen({super.key});

  @override
  ConsumerState<StudentSetupScreen> createState() => _StudentSetupScreenState();
}

class _StudentSetupScreenState extends ConsumerState<StudentSetupScreen> {
  final _nameController = TextEditingController();
  final _collegeController = TextEditingController();
  final _courseController = TextEditingController();
  String? _selectedSemester;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isSaving = false;

  Future<void> _onContinue() async {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your name')));
      return;
    }

    setState(() => _isSaving = true);

    try {
      final repository = ref.read(studentRepositoryProvider);
      await repository.saveProfile(
        StudentProfilesCompanion(
          name: drift.Value(_nameController.text),
          collegeName: drift.Value(_collegeController.text),
          course: drift.Value(_courseController.text),
          semesterName: drift.Value(_selectedSemester),
          semesterStartDate: drift.Value(_startDate),
          semesterEndDate: drift.Value(_endDate),
        ),
      );

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AttendancePolicyScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving profile: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Text(
                    "Let's get started",
                    style: context.asterTextTheme.headlineLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceSm),
                  Text(
                    'Tell us a bit about your current academic journey.',
                    style: context.asterTextTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),
            // Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Step 1 of 5',
                  style: context.asterTextTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  'Basic Info',
                  style: context.asterTextTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AsterSpacing.spaceXs),
            LinearProgressIndicator(
              value: 0.2,
              backgroundColor: context.colorScheme.surfaceContainerHighest,
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(9999),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            // Form
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AsterSpacing.spaceMd),
                child: Column(
                  children: [
                    AsterTextField(
                      label: 'Student Name',
                      hintText: 'e.g., Alex Walker',
                      controller: _nameController,
                    ),
                    const SizedBox(height: AsterSpacing.spaceLg),
                    AsterTextField(
                      label: 'College or University',
                      hintText: 'e.g., State University',
                      controller: _collegeController,
                    ),
                    const SizedBox(height: AsterSpacing.spaceLg),
                    AsterTextField(
                      label: 'Primary Course or Major',
                      hintText: 'e.g., Computer Science',
                      controller: _courseController,
                    ),
                    const SizedBox(height: AsterSpacing.spaceLg),
                    AsterDropdownField<String>(
                      label: 'Current Semester/Term',
                      hintText: 'Select current term',
                      value: _selectedSemester,
                      items: const [
                        DropdownMenuItem(
                          value: 'Fall 2023',
                          child: Text('Fall 2023'),
                        ),
                        DropdownMenuItem(
                          value: 'Spring 2024',
                          child: Text('Spring 2024'),
                        ),
                        DropdownMenuItem(
                          value: 'Summer 2024',
                          child: Text('Summer 2024'),
                        ),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      onChanged: (val) =>
                          setState(() => _selectedSemester = val),
                    ),
                    const SizedBox(height: AsterSpacing.spaceLg),
                    Row(
                      children: [
                        Expanded(
                          child: AsterDateField(
                            label: 'Start Date',
                            value: _startDate,
                            onDateSelected: (date) =>
                                setState(() => _startDate = date),
                          ),
                        ),
                        const SizedBox(width: AsterSpacing.spaceMd),
                        Expanded(
                          child: AsterDateField(
                            label: 'End Date',
                            value: _endDate,
                            onDateSelected: (date) =>
                                setState(() => _endDate = date),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXl),
            // Actions
            Row(
              children: [
                Expanded(
                  child: AsterSecondaryButton(
                    label: 'Back',
                    icon: const Icon(Icons.arrow_back, size: 18),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: AsterSpacing.spaceMd),
                Expanded(
                  child: AsterPrimaryButton(
                    label: 'Continue',
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    isLoading: _isSaving,
                    onPressed: _onContinue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
