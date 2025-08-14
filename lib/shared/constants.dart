import 'package:flutter/material.dart'; // Flutter UI toolkit

// AppColors: Central place for all app colors
// If you want to change the look, start here!
class AppColors {
  static const primary = Color(0xFF1E88E5); // Main brand color
  static const secondary = Color(0xFF0D47A1); // Accent color
  static const background = Color(0xFFFFFFFF); // App background
  static const surface = Color(0xFFF5F5F5); // Card backgrounds
  static const error = Color(0xFFB00020); // Error color
  static const onPrimary = Color(0xFFFFFFFF); // Text on primary
  static const onSecondary = Color(0xFFFFFFFF); // Text on secondary
  static const onBackground = Color(0xFF000000); // Text on background
  static const onSurface = Color(0xFF000000); // Text on surface
  static const onError = Color(0xFFFFFFFF); // Text on error
  // TODO: Add more colors for dark mode
}

// AppTextStyles: Consistent text styles for the app
class AppTextStyles {
  static const titleLarge = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  // For section headers
  static const titleMedium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  // For main body text
  static const bodyLarge = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    color: Colors.black,
  );
  // For secondary body text
  static const bodyMedium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: Colors.black,
  );
  // For captions or hints
  static const bodySmall = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    color: Colors.grey,
  );
  // TODO: Add more styles for buttons, links, etc.
}

// AppDimensions: Standard sizes for padding, borders, etc.
class AppDimensions {
  static const double paddingSmall = 8.0; // For tight spaces
  static const double paddingMedium = 16.0; // Default padding
  static const double paddingLarge = 24.0; // For big sections
  static const double borderRadius = 12.0; // Rounded corners
  static const double buttonHeight = 40.0; // Button height
  // NOTE: Adjust these values to change the feel of the app
}