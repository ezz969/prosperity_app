import 'package:flutter/material.dart'; // Flutter UI toolkit
import 'package:harari_prosperity_app/routes/app_routes.dart'; // App routes
import 'package:harari_prosperity_app/shared/widgets/custom_button.dart'; // Custom button widget
import 'package:harari_prosperity_app/shared/widgets/responsive_widgets.dart'; // Responsive padding widget

// HomeScreen is the first thing users see. Make it welcoming!
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add user personalization (e.g., show user's name)
    return Scaffold(
      appBar: null, // No app bar for a clean look
      body: ResponsivePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48), // Top space for breathing room
            Center(
              child: Image.asset(
                'assets/images/prosperity_logo.png',
                height: 170, // Logo size can be tweaked
                width: 170,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 32), // Space below logo
            // Friendly greeting
            const Text(
              "HELLO, USER", // TODO: Replace with actual user name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // App description
            const Text(
              "Welcome to Harari Regional Prosperity Party Political Analysis System. "
              "This application helps you to share the report to prosperity party office "
              "by giving you the guidance of standards to make the report and it gives "
              "you choices like document, pictures, links to attach with your report.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            // Section header
            const Text(
              "TO SEND A REPORT",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Main action button
            Center(
              child: CustomButton(
                text: "CLICK HERE", // Direct call to action
                onPressed: () {
                  // NOTE: This navigates to the report detail screen
                  Navigator.pushNamed(context, AppRoutes.reportDetail);
                },
                filled: true,
              ),
            ),
            // TODO: Add tips or recent reports for more engagement
          ],
        ),
      ),
    );
  }
}