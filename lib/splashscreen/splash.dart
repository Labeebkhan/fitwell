import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Run after first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final splashProvider = context.read<SplashProvider>();
      splashProvider.loadApp(context);

      splashProvider.addListener(() {
        if (splashProvider.isSplashDone) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen GIF as splash background
          Positioned.fill(
            child: Image.asset(
              'assets/Fitwell.gif', // your animated GIF file
              // fit: BoxFit.cover,
            ),
          ),
          // Optional: Overlay branding text/logo
        ],
      ),
    );
  }
}
