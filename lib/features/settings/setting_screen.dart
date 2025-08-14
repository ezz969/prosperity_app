import 'package:flutter/material.dart'; // Flutter UI toolkit
import 'package:harari_prosperity_app/routes/app_routes.dart'; // App routes
import 'package:harari_prosperity_app/shared/widgets/confirmation_dialog.dart'; // Confirmation dialog widget
import 'package:harari_prosperity_app/shared/widgets/profile_item.dart'; // Profile item widget

// SettingsScreen: User settings for password, account, language
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add dark mode toggle
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth < 500 ? double.infinity : 400;
          EdgeInsets padding = constraints.maxWidth < 500
              ? const EdgeInsets.all(12)
              : const EdgeInsets.all(20);
          return SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  children: [
                    // Password settings
                    ProfileItem(
                      icon: Icons.password,
                      title: "Password Settings",
                      onTap: () => Navigator.pushNamed(context, AppRoutes.passwordSettings),
                    ),
                    // Delete account option
                    ProfileItem(
                      icon: Icons.delete,
                      title: "Delete Account",
                      onTap: () => _showDeleteConfirmation(context),
                    ),
                    // Language settings
                    ProfileItem(
                      icon: Icons.language,
                      title: "Language",
                      onTap: () => Navigator.pushNamed(context, AppRoutes.language),
                    ),
                    // TODO: Add notification settings
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Show confirmation dialog before deleting account
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "Delete Account",
        message: "Are you sure you want to delete your account? This action cannot be undone.",
        confirmText: "Delete Account",
        onConfirm: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, AppRoutes.splash);
        },
        confirmColor: Colors.red,
      ),
    );
  }
}