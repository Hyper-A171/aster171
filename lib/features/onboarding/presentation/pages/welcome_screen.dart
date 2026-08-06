import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/widgets/buttons/aster_primary_button.dart';
import '../../../../core/widgets/buttons/aster_secondary_button.dart';
import '../../../dashboard/presentation/pages/home_navigation_wrapper.dart';
import 'student_setup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAo0sPmpOignNp8UJApFvq2-QlId7Lf3saf3hpz8pROV0WifF3oOeKCUlaScl2AXks-QZKT3OkXveG6mPJyrExq5GB4QZr-7n7QEQ3rQe8c50gqgqsZeQ3KbEAKCpmX3du3QCHw8WO5yo2R7OtmFxxwg3UCVOH35MhYlbBp8-NMtOiTF7JXO4k3qEL8p3bP3QQixJB7Qj5sE34l1HdjbQi0MSGvL_b5XXhh9QM0Zygx-J03iMe7ju5H',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    context.colorScheme.surface.withValues(alpha: 0.2),
                    context.colorScheme.surface,
                  ],
                  stops: const [0.0, 0.5, 0.7],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sideMargin,
                vertical: AsterSpacing.spaceXl,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  // Logo
                  Icon(Icons.spa, size: 64, color: context.colorScheme.primary),
                  const SizedBox(height: AsterSpacing.spaceLg),
                  // Typography
                  Text(
                    'Balance college and internship with confidence.',
                    textAlign: TextAlign.center,
                    style: context.isMobile
                        ? context.asterTextTheme.headlineLarge
                        : context.asterTextTheme.displayLarge,
                  ),
                  const SizedBox(height: AsterSpacing.spaceMd),
                  Text(
                    'Aster finds the safest internship days without putting your attendance at risk.',
                    textAlign: TextAlign.center,
                    style: context.asterTextTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AsterSpacing.spaceXl),
                  // Actions
                  AsterPrimaryButton(
                    label: 'Get Started',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const StudentSetupScreen(),
                        ),
                      );
                    },
                    fullWidth: true,
                  ),
                  const SizedBox(height: AsterSpacing.spaceMd),
                  AsterSecondaryButton(
                    label: 'I already have data',
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const HomeNavigationWrapper(),
                        ),
                        (route) => false,
                      );
                    },
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
