import 'package:flutter/material.dart'; // Flutter UI toolkit
import 'package:harari_prosperity_app/routes/app_routes.dart'; // App routes
import 'package:harari_prosperity_app/shared/widgets/custom_button.dart'; // Custom button widget
import 'package:harari_prosperity_app/shared/widgets/responsive_widgets.dart'; // Responsive padding widget

// LoginScreen: Handles user authentication. Make it friendly and clear!
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Add error messages for failed login attempts
    return Scaffold(
      appBar: AppBar(title: const Text("Login")), // Simple app bar
      body: ResponsivePadding(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Welcome message
              const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Username/email field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Username Or Email", // Accepts either
                  hintText: "example@gmail.com", // Example for clarity
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              // Password field
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 10),
              // Forgot password link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // NOTE: Navigates to forgot password screen
                    Navigator.pushNamed(context, AppRoutes.forgot);
                  },
                  child: const Text("Forgot Password?"),
                ),
              ),
              const SizedBox(height: 30),
              // Login button
              Center(
                child: CustomButton(
                  text: "Log In",
                  onPressed: () {
                    // TODO: Validate credentials before navigating
                    Navigator.pushReplacementNamed(context, AppRoutes.navigation);
                  },
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              // Sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Alternative sign up options
              const Center(child: Text("or sign up with")),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {
                    // TODO: Implement Facebook login
                  }, icon: const Icon(Icons.facebook)),
                  const SizedBox(width: 20),
                  IconButton(onPressed: () {
                    // TODO: Implement Google login
                  }, icon: const Icon(Icons.g_mobiledata)),
                ],
              ),
              // NOTE: Consider adding biometric login in future
            ],
          ),
        ),
      ),
    );
  }
}