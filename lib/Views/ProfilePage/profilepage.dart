import 'package:flutter/material.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(child: Text(appLoc.setting_page)),

      // ListView(
      //   padding: const EdgeInsets.all(16),
      //   children: [
      //     // --- Account
      //     const SectionHeader(title: "Account"),
      //     SettingsTile(
      //       icon: Icons.person,
      //       title: "Edit Profile",
      //       onTap: () {}, // Navigate to Edit Profile
      //     ),
      //     SettingsTile(
      //       icon: Icons.lock,
      //       title: "Change Password",
      //       onTap: () {}, // Change password
      //     ),

      //     const SizedBox(height: 24),

      //     // --- Appearance
      //     const SectionHeader(title: "Appearance"),
      //     SettingsTile(
      //       icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
      //       title: "Theme",
      //       onTap: () {

      //       },
      //       trailing: Switch(
      //         value: isDarkMode,
      //         onChanged: (value) {
      //           // Call your theme provider or setState to switch theme
      //         },
      //       ),
      //     ),
      //     SettingsTile(
      //       icon: Icons.text_fields,
      //       onTap: () {},
      //       title: "Font Size",
      //       trailing: DropdownButton<double>(
      //         value: 1.0,
      //         items: [
      //           DropdownMenuItem(child: Text("Small"), value: 0.85),
      //           DropdownMenuItem(child: Text("Medium"), value: 1.0),
      //           DropdownMenuItem(child: Text("Large"), value: 1.15),
      //         ],
      //         onChanged: (v) {},
      //       ),
      //     ),

      //     const SizedBox(height: 24),

      //     // --- Notifications
      //     const SectionHeader(title: "Notifications"),
      //     SettingsTile(
      //       icon: Icons.notifications,
      //       onTap: () {},
      //       title: "Enable Notifications",
      //       trailing: Switch(value: true, onChanged: (value) {}),
      //     ),

      //     const SizedBox(height: 24),

      //     // --- Language
      //     const SectionHeader(title: "Language"),
      //     SettingsTile(
      //       icon: Icons.language,
      //       onTap: () {},
      //       title: "App Language",
      //       trailing: DropdownButton<String>(
      //         value: "en",
      //         items: [
      //           DropdownMenuItem(child: Text("English"), value: "en"),
      //           DropdownMenuItem(child: Text("Arabic"), value: "ar"),
      //           DropdownMenuItem(child: Text("Hindi"), value: "hi"),
      //         ],
      //         onChanged: (val) {},
      //       ),
      //     ),

      //     const SizedBox(height: 24),

      //     // --- Privacy & Security
      //     const SectionHeader(title: "Privacy & Security"),
      //     SettingsTile(
      //       icon: Icons.privacy_tip,
      //       title: "Privacy Policy",
      //       onTap: () {},
      //     ),

      //     const SizedBox(height: 24),

      //     // --- Data & Storage
      //     const SectionHeader(title: "Data & Storage"),
      //     SettingsTile(icon: Icons.delete, title: "Clear Cache", onTap: () {}),

      //     const SizedBox(height: 32),

      //     // --- About & Logout
      //     SettingsTile(icon: Icons.info, title: "About App", onTap: () {}),
      //     SettingsTile(
      //       icon: Icons.logout,
      //       title: "Logout",
      //       textColor: Colors.red,
      //       onTap: () {},
      //     ),
      //   ],
      // ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(color: Colors.grey, letterSpacing: 2),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;
  final Color? textColor;

  const SettingsTile({
    required this.icon,
    required this.title,
    this.trailing,
    required this.onTap,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Theme.of(context).primaryColor),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
      ),
      trailing: trailing,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      minLeadingWidth: 24,
    );
  }
}
