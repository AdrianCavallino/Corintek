import 'package:flutter/material.dart';

void main() {
  runApp(const CorintekApp());
}

class CorintekApp extends StatelessWidget {
  const CorintekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
