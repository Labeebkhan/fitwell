import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/splash_provider.dart';
import 'provider/password_visibility_provider.dart';
import 'provider/categoryprovider.dart';
import 'provider/Drawer.dart';
import 'splashscreen/splash.dart';
import 'screen/home.dart';
import 'screen/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ), // ✅ Added Provider
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ), // ✅ Added NavigationProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => Home(),
      },
    );
  }
}
