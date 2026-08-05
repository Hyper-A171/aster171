import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/chips/aster_status_chip.dart';
import '../../../../core/widgets/layout/aster_section_header.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/widgets/cards/aster_status_card.dart';
import '../../../../core/models/attendance_summary.dart';
import 'subject_details_screen.dart';

class AllSubjectsScreen extends ConsumerWidget {
  const AllSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSubjectsAsync = ref.watch(activeSubjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Subjects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Subject',
            onPressed: () => _showAddSubjectDialog(context, ref),
          ),
        ],
      ),
      body: activeSubjectsAsync.when(
        data: (subjects) => _buildPopulatedState(context, ref, subjects),
        loading: () => const Center(
          child: CircularProgressIndicator(
            semanticsLabel: 'Loading subjects...',
          ),
        ),
        error: (err, stack) => _buildErrorState(context, err),
      ),
    );
  }

  Widget _buildPopulatedState(
    BuildContext context,
    WidgetRef ref,
    List<Subject> subjects,
  ) {
    if (subjects.isEmpty) {
      return _buildEmptyState(context, ref);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.sideMargin,
        vertical: AsterSpacing.spaceLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AsterSectionHeader(
            title: 'Curriculum',
            subtitle: 'Ongoing courses and labs',
          ),
          const SizedBox(height: AsterSpacing.spaceMd),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: subjects.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AsterSpacing.spaceMd),
            itemBuilder: (context, index) =>
                _SubjectListCard(subject: subjects[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AsterSpacing.spaceLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book_outlined,
              size: 64,
              color: context.colorScheme.outlineVariant,
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            Text(
              'No subjects added yet.',
              style: context.asterTextTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AsterSpacing.spaceLg),
            ElevatedButton.icon(
              onPressed: () => _showAddSubjectDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Add Subject'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(160, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AsterSpacing.spaceLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: AsterSpacing.spaceMd),
            Text(
              'Failed to load subjects',
              style: context.asterTextTheme.titleMedium,
            ),
            const SizedBox(height: AsterSpacing.spaceXs),
            Text(
              error.toString(),
              style: context.asterTextTheme.bodySmall?.copyWith(
                color: context.colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
                            studentProfileId: 1, // Default profile ID
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

class _SubjectListCard extends ConsumerWidget {
  final Subject subject;

  const _SubjectListCard({required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(
      subjectAttendanceSummaryProvider(subject.id),
    );

    final riskStatus = summaryAsync.value?.riskStatus ?? AsterStatus.safe;

    return Material(
      color: context.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SubjectDetailsScreen(subjectId: subject.id),
            ),
          );
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject.name,
                      style: context.asterTextTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subject.code != null && subject.code!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        subject.code!,
                        style: context.asterTextTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: AsterSpacing.spaceSm,
                      runSpacing: AsterSpacing.spaceXs,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            subject.subjectType,
                            style: context.asterTextTheme.labelSmall,
                          ),
                        ),
                        AsterStatusChip(status: riskStatus),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.chevron_right,
                color: context.colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
