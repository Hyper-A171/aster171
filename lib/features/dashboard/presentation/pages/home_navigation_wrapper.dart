import 'package:flutter/material.dart';
import '../../../../core/widgets/navigation/aster_bottom_navigation.dart';
import 'dashboard_screen.dart';
import 'today_schedule_screen.dart';
import '../../../subjects/presentation/pages/all_subjects_screen.dart';
import '../../../planning/presentation/pages/weekly_planner_screen.dart';
import '../../../internship/presentation/pages/internship_progress_screen.dart';
import '../../../settings/presentation/pages/settings_screen.dart';

class HomeNavigationWrapper extends StatefulWidget {
  const HomeNavigationWrapper({super.key});

  @override
  State<HomeNavigationWrapper> createState() => _HomeNavigationWrapperState();
}

class _HomeNavigationWrapperState extends State<HomeNavigationWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const AllSubjectsScreen(),
    const WeeklyPlannerScreen(),
    const InternshipProgressScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: AsterBottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
