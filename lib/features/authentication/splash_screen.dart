import 'package:flutter/material.dart';
import 'package:harari_prosperity_app/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.choice);
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/prosperity_logo.png', width: 160),
      ),
    );
  }
}