import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/theme/aster_theme.dart';
import 'app/theme/theme_mode_controller.dart';
import 'features/onboarding/presentation/pages/splash_screen.dart';
import 'core/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.initialize();
  runApp(const ProviderScope(child: AsterApp()));
}

class AsterApp extends StatelessWidget {
  const AsterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeModeController.instance,
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Aster',
          theme: AsterTheme.light,
          darkTheme: AsterTheme.dark,
          themeMode: mode,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
