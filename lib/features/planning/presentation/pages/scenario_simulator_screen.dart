import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../app/theme/aster_typography.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/cards/aster_card.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';

class ScenarioSimulatorScreen extends StatefulWidget {
  const ScenarioSimulatorScreen({super.key});

  @override
  State<ScenarioSimulatorScreen> createState() =>
      _ScenarioSimulatorScreenState();
}

class _ScenarioSimulatorScreenState extends State<ScenarioSimulatorScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scenario Simulator')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select an action to predict its impact on your attendance and schedule.',
              style: context.asterTextTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Options
            _buildOption(0, 'Go to internship tomorrow', Icons.work_outline),
            const SizedBox(height: AsterSpacing.spaceMd),
            _buildOption(1, 'Miss one lecture', Icons.person_off),
            const SizedBox(height: AsterSpacing.spaceMd),
            _buildOption(2, 'Complete a half-day', Icons.timelapse),
            const SizedBox(height: AsterSpacing.spaceLg),

            AsterPrimaryButton(
              label: 'Run Simulation',
              icon: const Icon(Icons.calculate),
              onPressed: () {},
              fullWidth: true,
            ),
            const SizedBox(height: AsterSpacing.spaceXl),

            // Results
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryFixed.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.colorScheme.primaryFixed),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.science,
                    color: context.colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Previewing simulated data based on current schedule.',
                    style: context.asterTextTheme.labelSmall?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceLg),

            // Attendance Card
            AsterCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overall Attendance',
                        style: context.asterTextTheme.titleMedium,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: context.asterColors.safeContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Safe',
                          style: TextStyle(
                            color: context.asterColors.onSafeContainer,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildSimStat('Current', '86%'),
                      const Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.grey,
                      ),
                      _buildSimStat(
                        'Simulated',
                        '82%',
                        isPrimary: true,
                        isDown: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.82,
                    color: context.colorScheme.primary,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0%', style: TextStyle(fontSize: 10)),
                      Text('75% Min', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AsterSpacing.spaceMd),

            // Affected Subjects
            AsterCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.menu_book, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'Subjects Affected',
                        style: context.asterTextTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildAffectedItem('Advanced Physics', '-1 Lecture'),
                  const SizedBox(height: 8),
                  _buildAffectedItem('Data Structures', '-1 Lab'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index, String label, IconData icon) {
    final isSelected = _selectedOption == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedOption = index),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primaryFixed
              : context.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? null
              : [
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Text(label, style: context.asterTextTheme.titleMedium),
              ],
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.outlineVariant,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimStat(
    String label,
    String value, {
    bool isPrimary = false,
    bool isDown = false,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.asterTextTheme.labelSmall?.copyWith(
              color: isPrimary ? context.colorScheme.primary : null,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: context.asterTextTheme.headlineLarge?.copyWith(
                  color: isPrimary ? context.colorScheme.primary : null,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isDown)
                Icon(
                  Icons.trending_down,
                  size: 20,
                  color: context.colorScheme.error,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAffectedItem(String title, String impact) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.asterTextTheme.bodyMedium),
          Text(
            impact,
            style: context.asterTextTheme.labelSmall?.copyWith(
              color: context.colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
