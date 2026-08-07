import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:aster/app/theme/aster_spacing.dart';
import 'package:aster/app/theme/aster_theme.dart';
import 'package:aster/core/responsive/responsive_layout.dart';
import 'package:aster/core/widgets/buttons/aster_primary_button.dart';
import 'package:aster/core/widgets/fields/aster_text_field.dart';
import 'package:aster/core/widgets/fields/aster_date_field.dart';
import 'package:aster/core/widgets/fields/aster_dropdown_field.dart';
import 'package:aster/core/providers/database_providers.dart';
import 'package:aster/core/database/aster_database.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameController = TextEditingController();
  final _collegeController = TextEditingController();
  final _courseController = TextEditingController();
  String _selectedSemester = 'Semester 5';
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isLoaded = false;
  bool _isSaving = false;

  final List<String> _semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
  ];

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_refreshHeader);
    _courseController.addListener(_refreshHeader);
  }

  void _refreshHeader() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _nameController
      ..removeListener(_refreshHeader)
      ..dispose();
    _collegeController.dispose();
    _courseController
      ..removeListener(_refreshHeader)
      ..dispose();
    super.dispose();
  }

  void _populateData(StudentProfile? profile) {
    if (_isLoaded || profile == null) return;
    _nameController.text = profile.name;
    _collegeController.text = profile.collegeName ?? '';
    _courseController.text =
        profile.course ?? 'Diploma in Computer Engineering';
    if (profile.semesterName != null &&
        _semesters.contains(profile.semesterName)) {
      _selectedSemester = profile.semesterName!;
    }
    _startDate = profile.semesterStartDate;
    _endDate = profile.semesterEndDate;
    _isLoaded = true;
  }

  Future<void> _saveProfile() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your name')));
      return;
    }
    if (_startDate != null &&
        _endDate != null &&
        _endDate!.isBefore(_startDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semester end must follow its start.')),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      final repository = ref.read(studentRepositoryProvider);
      await repository.saveProfile(
        StudentProfilesCompanion(
          name: drift.Value(_nameController.text.trim()),
          collegeName: drift.Value(
            _collegeController.text.trim().isEmpty
                ? null
                : _collegeController.text.trim(),
          ),
          course: drift.Value(
            _courseController.text.trim().isEmpty
                ? null
                : _courseController.text.trim(),
          ),
          semesterName: drift.Value(_selectedSemester),
          semesterStartDate: drift.Value(_startDate),
          semesterEndDate: drift.Value(_endDate),
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error updating profile: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(currentStudentProfileProvider);

    profileAsync.whenData((profile) {
      _populateData(profile);
    });

    final String initials = _nameController.text.trim().isNotEmpty
        ? _nameController.text
              .trim()
              .split(' ')
              .map((e) => e.isEmpty ? '' : e[0])
              .take(2)
              .join()
              .toUpperCase()
        : 'AW';

    return Scaffold(
      appBar: AppBar(title: const Text('Student Profile')),
      body: profileAsync.when(
        data: (_) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.sideMargin,
            vertical: AsterSpacing.spaceLg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: context.colorScheme.primaryContainer,
                      child: Text(
                        initials,
                        style: context.asterTextTheme.headlineMedium?.copyWith(
                          color: context.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _nameController.text.isEmpty
                          ? 'Student'
                          : _nameController.text,
                      style: context.asterTextTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_courseController.text.isNotEmpty)
                      Text(
                        _courseController.text,
                        style: context.asterTextTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    const SizedBox(height: AsterSpacing.spaceXs),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AsterSpacing.spaceSm,
                        vertical: AsterSpacing.spaceXs,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '3-year diploma • $_selectedSemester',
                        style: context.asterTextTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceXl),
              Text(
                'Personal & Academic Details',
                style: context.asterTextTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              AsterTextField(
                label: 'Full Name',
                hintText: 'e.g. Alex Walker',
                controller: _nameController,
                prefixIcon: const Icon(Icons.person_outline),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              AsterTextField(
                label: 'College / University',
                hintText: 'e.g. Stanford University',
                controller: _collegeController,
                prefixIcon: const Icon(Icons.school_outlined),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              AsterTextField(
                label: 'Course / Major',
                hintText: 'Diploma in Computer Engineering',
                controller: _courseController,
                prefixIcon: const Icon(Icons.book_outlined),
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              AsterDropdownField<String>(
                label: 'Current Semester',
                value: _selectedSemester,
                items: _semesters
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedSemester = val);
                },
              ),
              const SizedBox(height: AsterSpacing.spaceMd),
              Row(
                children: [
                  Expanded(
                    child: AsterDateField(
                      label: 'Semester Start',
                      value: _startDate,
                      onDateSelected: (date) =>
                          setState(() => _startDate = date),
                    ),
                  ),
                  const SizedBox(width: AsterSpacing.spaceMd),
                  Expanded(
                    child: AsterDateField(
                      label: 'Semester End',
                      value: _endDate,
                      onDateSelected: (date) => setState(() => _endDate = date),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AsterSpacing.spaceXl),
              AsterPrimaryButton(
                label: _isSaving ? 'Saving...' : 'Save Profile Changes',
                icon: const Icon(Icons.check),
                onPressed: _isSaving ? null : _saveProfile,
                fullWidth: true,
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Error loading profile: $err')),
      ),
    );
  }
}
