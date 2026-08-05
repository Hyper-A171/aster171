import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/actions/aster_floating_action_button.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import '../../../planning/presentation/pages/weekly_planner_screen.dart';

class AddSubjectsScreen extends ConsumerWidget {
  const AddSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Subjects')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Step 4 of 5
            Text(
              'Step 4 of 5',
              style: context.asterTextTheme.labelMedium?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceXs),
            LinearProgressIndicator(
              value: 0.8,
              backgroundColor: context.colorScheme.surfaceContainerHigh,
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(9999),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            Text(
              'Curriculum & Subjects',
              style: context.asterTextTheme.headlineSmall,
            ),
            Text(
              'Add your subjects to set up your weekly schedule.',
              style: context.asterTextTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            activeSubjectsAsync.when(
              data: (subjects) {
                if (subjects.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: context.colorScheme.outlineVariant,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          size: 48,
                          color: context.colorScheme.outlineVariant,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No subjects added yet.',
                          style: context.asterTextTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tap the "+" button below to add your first subject.',
                          style: context.asterTextTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjects.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AsterSpacing.spaceMd),
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return _buildSubjectItem(context, ref, subject);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
            ),
          ],
        ),
      ),
      floatingActionButton: AsterFloatingActionButton(
        onPressed: () => _showAddSubjectDialog(context, ref),
        icon: const Icon(Icons.add),
        tooltip: 'Add Subject',
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.sideMargin),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border(
            top: BorderSide(color: context.colorScheme.outlineVariant),
          ),
        ),
        child: SafeArea(
          child: AsterPrimaryButton(
            label: 'Continue to Planner',
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      const WeeklyPlannerScreen(isFromOnboarding: true),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectItem(
    BuildContext context,
    WidgetRef ref,
    Subject subject,
  ) {
    return AsterCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject.name,
                style: context.asterTextTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subject.code != null && subject.code!.isNotEmpty)
                Text(
                  subject.code!,
                  style: context.asterTextTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  subject.subjectType,
                  style: context.asterTextTheme.labelSmall,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () async {
              await ref
                  .read(subjectsRepositoryProvider)
                  .archiveSubject(subject.id);
            },
          ),
        ],
      ),
    );
  }

  void _showAddSubjectDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final codeController = TextEditingController();
    String subjectType = 'Theory';
    bool isMandatory = true;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Subject'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Subject Name',
                        hintText: 'e.g. Advanced Algorithms',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: codeController,
                      decoration: const InputDecoration(
                        labelText: 'Subject Code',
                        hintText: 'e.g. CS 401',
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: subjectType,
                      decoration: const InputDecoration(labelText: 'Type'),
                      items: const [
                        DropdownMenuItem(
                          value: 'Theory',
                          child: Text('Theory'),
                        ),
                        DropdownMenuItem(
                          value: 'Practical',
                          child: Text('Practical'),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) setState(() => subjectType = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      title: const Text('Mandatory Subject'),
                      value: isMandatory,
                      onChanged: (val) => setState(() => isMandatory = val),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.trim().isEmpty) return;

                    await ref
                        .read(subjectsRepositoryProvider)
                        .addSubject(
                          SubjectsCompanion.insert(
                            studentProfileId: 1,
                            name: nameController.text.trim(),
                            code: drift.Value(
                              codeController.text.trim().isEmpty
                                  ? null
                                  : codeController.text.trim(),
                            ),
                            subjectType: subjectType,
                            isMandatory: drift.Value(isMandatory),
                          ),
                        );

                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
