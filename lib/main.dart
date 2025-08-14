import 'package:flutter/material.dart'; // Flutter's main UI toolkit
import 'shared/constants.dart'; // Custom constants for the app
import 'routes/app_routes.dart'; // App route definitions

// Entry point for the Prosperity Party app
// If you ever want to add analytics, this is a good place!
void main() {
  // TODO: Consider error handling for runApp in future
  runApp(const ProsperityApp());
}

// Main app widget. If you want to customize the look, start here!
// You can always add more features or tweak the UI here.
class ProsperityApp extends StatelessWidget {
  const ProsperityApp({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE: You can tweak the theme below to match your brand colors
    // If you want to change fonts, colors, or add new widgets, this is the spot!
    // TODO: Maybe add a custom error page for unknown routes?
    return MaterialApp(
      title: 'Prosperity Party', // App name shown in task switcher
      // If you want to localize the app, add 'localizationsDelegates' here
      theme: ThemeData(
        primaryColor: AppColors.primary, // Custom primary color
        primarySwatch: Colors.blue, // Default swatch, can be changed
        fontFamily: 'Poppins', // Using Poppins for a modern look
        scaffoldBackgroundColor: Colors.white, // Clean background
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Padding for inputs
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1, // Slight shadow for depth
        ),
        // TODO: Add more theme customizations (button styles, etc.)
      ),
      initialRoute: AppRoutes.splash, // Start at splash screen
      routes: AppRoutes.routes, // Defined in routes/app_routes.dart
      // TODO: Add navigator observers for analytics if needed
      // NOTE: If you ever want to add deep linking, check the docs for 'onGenerateRoute'
      // Imperfection: Uncomment below to test unknown route handling
      // onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('Page not found!')))),
    );
  }
}