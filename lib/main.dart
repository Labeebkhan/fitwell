import 'package:flutter/material.dart';
import 'package:fitwell/screen/login.dart';

void main() {
  runApp(const fitwell());
}

class fitwell extends StatefulWidget {
  const fitwell({super.key});

  @override
  State<fitwell> createState() => _fitwellState();
}

class _fitwellState extends State<fitwell> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
  }
}
