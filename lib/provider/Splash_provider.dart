import 'dart:async';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool _isSplashDone = false;
  bool get isSplashDone => _isSplashDone;

  Future<void> loadApp(BuildContext context) async {
    // Simulate asset loading delay (replace with actual Firebase/auth loading if needed)
    await Future.delayed(const Duration(seconds: 2));

    // Example: preload an image asset
    await precacheImage(const AssetImage('assets/Fitwell.gif'), context);

    _isSplashDone = true;
    notifyListeners();
  }
}
