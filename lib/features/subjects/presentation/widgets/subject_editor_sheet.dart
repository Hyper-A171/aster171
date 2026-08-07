import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/database/aster_database.dart';
import '../../../../core/providers/database_providers.dart';

Future<void> showSubjectEditorSheet(
  BuildContext context,
  WidgetRef ref, {
  Subject? subject,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (_) => _SubjectEditor(subject: subject, ref: ref),
  );
}

class _SubjectEditor extends StatefulWidget {
  const _SubjectEditor({required this.subject, required this.ref});
  final Subject? subject;
  final WidgetRef ref;

  @override
  State<_SubjectEditor> createState() => _SubjectEditorState();
}

class _SubjectEditorState extends State<_SubjectEditor> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _code;
  late String _type;
  late bool _mandatory;
  bool _saving = false;

  static const _types = ['Theory', 'Practical', 'DSC', 'AEC', 'DSE', 'INP'];

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.subject?.name ?? '');
    _code = TextEditingController(text: widget.subject?.code ?? '');
    final oldType = widget.subject?.subjectType;
    _type = _types.contains(oldType) ? oldType! : 'Theory';
    _mandatory = widget.subject?.isMandatory ?? true;
  }

  @override
  void dispose() {
    _name.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final profile = await widget.ref.read(
        currentStudentProfileProvider.future,
      );
      if (profile == null) throw Exception('Complete your profile first.');
      final existing =
          widget.ref.read(activeSubjectsProvider).value ?? const <Subject>[];
      final normalizedCode = _code.text.trim().toUpperCase();
      final duplicate = existing.any(
        (item) =>
            item.id != widget.subject?.id &&
            normalizedCode.isNotEmpty &&
            item.code?.trim().toUpperCase() == normalizedCode,
      );
      if (duplicate) throw Exception('That subject code already exists.');

      final changes = SubjectsCompanion(
        name: drift.Value(_name.text.trim()),
        code: drift.Value(normalizedCode.isEmpty ? null : normalizedCode),
        subjectType: drift.Value(_type),
        isMandatory: drift.Value(_mandatory),
        updatedAt: drift.Value(DateTime.now()),
      );
      if (widget.subject == null) {
        await widget.ref
            .read(subjectsRepositoryProvider)
            .addSubject(
              SubjectsCompanion.insert(
                studentProfileId: profile.id,
                name: _name.text.trim(),
                code: drift.Value(
                  normalizedCode.isEmpty ? null : normalizedCode,
                ),
                subjectType: _type,
                isMandatory: drift.Value(_mandatory),
              ),
            );
      } else {
        await widget.ref
            .read(subjectsRepositoryProvider)
            .updateSubject(widget.subject!.id, changes);
      }
      if (mounted) Navigator.pop(context);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString().replaceFirst('Exception: ', '')),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AsterSpacing.spaceLg,
        0,
        AsterSpacing.spaceLg,
        MediaQuery.viewInsetsOf(context).bottom + AsterSpacing.spaceLg,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.subject == null ? 'Add Subject' : 'Edit Subject',
                style: context.asterTextTheme.headlineSmall,
              ),
              const SizedBox(height: AsterSpacing.spaceXs),
              Text(
                'These details are used by your timetable, attendance and reminders.',
                style: context.asterTextTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceLg),
              TextFormField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Subject name',
                  prefixIcon: Icon(Icons.menu_book_outlined),
                ),
                validator: (value) => value == null || value.trim().length < 2
                    ? 'Enter a valid subject name.'
                    : null,
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              TextFormField(
                controller: _code,
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  labelText: 'Course code (optional)',
                  prefixIcon: Icon(Icons.tag),
                  hintText: '315319',
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              DropdownButtonFormField<String>(
                initialValue: _type,
                decoration: const InputDecoration(
                  labelText: 'Subject type',
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                items: _types
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _type = value ?? _type),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Mandatory subject'),
                subtitle: const Text(
                  'Include it in attendance safety planning',
                ),
                value: _mandatory,
                onChanged: (value) => setState(() => _mandatory = value),
              ),
              const SizedBox(height: AsterSpacing.spaceLg),
              FilledButton.icon(
                onPressed: _saving ? null : _save,
                icon: _saving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save_outlined),
                label: Text(
                  widget.subject == null ? 'Add Subject' : 'Save Changes',
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
