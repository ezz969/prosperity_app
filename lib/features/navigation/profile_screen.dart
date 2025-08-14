import 'package:flutter/material.dart';
import 'package:harari_prosperity_app/routes/app_routes.dart';
import 'package:harari_prosperity_app/shared/widgets/confirmation_dialog.dart';

import 'package:harari_prosperity_app/features/faq/faq_help_screen.dart';
import 'package:harari_prosperity_app/shared/widgets/profile_item.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth < 500 ? double.infinity : 400;
          EdgeInsets padding = constraints.maxWidth < 500
              ? const EdgeInsets.all(12)
              : const EdgeInsets.all(20);
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: padding,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Column(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, size: 50, color: Colors.white),
                          ),
                          SizedBox(height: 20),
                          Text("User Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("ID: 25030024", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ProfileItem(
                        icon: Icons.edit,
                        title: "Edit Profile",
                        onTap: () => Navigator.pushNamed(context, AppRoutes.editProfile),
                      ),
                      ProfileItem(
                        icon: Icons.lock,
                        title: "Security",
                        onTap: () => Navigator.pushNamed(context, AppRoutes.security),
                      ),
                      ProfileItem(
                        icon: Icons.settings,
                        title: "Setting",
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.settings);
                        },
                      ),
                      ProfileItem(
                        icon: Icons.help,
                        title: "Faq and Help",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FaqHelpScreen()),
                          );
                        },
                      ),
                      ProfileItem(
                        icon: Icons.logout,
                        title: "Logout",
                        onTap: () => _showLogoutConfirmation(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: "End Session",
        message: "Are you sure you want to log out?",
        confirmText: "Yes",
        onConfirm: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, AppRoutes.splash);
        },
      ),
    );
  }
}