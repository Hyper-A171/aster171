import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/providers/database_providers.dart';
import '../../../../core/services/notification_service.dart';
import '../../../dashboard/presentation/pages/home_navigation_wrapper.dart';
import 'welcome_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInitialRoute();
  }

  void _checkInitialRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final db = ref.read(databaseProvider);
    final profile = await db.studentProfileDao.getProfile().timeout(
      const Duration(seconds: 8),
      onTimeout: () => null,
    );

    unawaited(() async {
      try {
        await db.seedMsbteAcademicCalendar();
        if (profile != null) {
          await NotificationService.instance.syncAllReminders(db);
        }
      } on Object {
        // Calendar and reminder maintenance must never block startup.
      }
    }());

    if (!mounted) return;

    if (profile != null) {
      // Data exists: Skip onboarding permanently and jump straight to Dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeNavigationWrapper()),
      );
    } else {
      // First time user: Show WelcomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.spa, size: 80, color: context.colorScheme.primary),
            const SizedBox(height: 24),
            Text(
              'Aster',
              style: context.asterTextTheme.displaySmall?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
