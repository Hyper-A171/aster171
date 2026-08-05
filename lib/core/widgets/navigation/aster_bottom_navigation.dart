import 'package:flutter/material.dart';
import '../../../app/theme/aster_spacing.dart';

/// Reusable Aster Bottom Navigation Bar based on Material 3 NavigationBar.
class AsterBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AsterBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.today_outlined),
          selectedIcon: Icon(Icons.today),
          label: 'Today',
        ),
        NavigationDestination(
          icon: Icon(Icons.book_outlined),
          selectedIcon: Icon(Icons.book),
          label: 'Subjects',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
          label: 'Plan',
        ),
        NavigationDestination(
          icon: Icon(Icons.work_outline),
          selectedIcon: Icon(Icons.work),
          label: 'Internship',
        ),
        NavigationDestination(
          icon: Icon(Icons.more_horiz_outlined),
          selectedIcon: Icon(Icons.more_horiz),
          label: 'More',
        ),
      ],
    );
  }
}
