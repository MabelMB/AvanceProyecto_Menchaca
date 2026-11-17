import 'package:flutter/material.dart';
import 'package:flutter_insbook/auth/screens/auth_check_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InsBook',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color(0xFF12365c)),
      ),
      home: const AuthCheckScreen(),
    );
  }
}
