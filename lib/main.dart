import 'package:flutter/material.dart';
import 'package:fitwell/screen/login.dart';
import 'package:provider/provider.dart';
import 'provider/password_visibility_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
