import 'package:flutter/material.dart';
import '../../../../app/theme/aster_spacing.dart';
import '../../../../app/theme/aster_theme.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../app/theme/theme_mode_controller.dart';
import '../../../../core/widgets/layout/aster_section_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.sideMargin,
          vertical: AsterSpacing.spaceLg,
        ),
        children: [
          const AsterSectionHeader(title: 'Preference'),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme Mode'),
            subtitle: ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeModeController.instance,
              builder: (context, mode, _) => Text(mode.name.toUpperCase()),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => ThemeModeController.instance.toggleTheme(),
          ),
          const Divider(),
          const AsterSectionHeader(title: 'Account'),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Profile'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('Notifications'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(),
          const AsterSectionHeader(title: 'Support'),
          const ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Help Center'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About Aster'),
            trailing: Icon(Icons.chevron_right),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {},
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
