import 'package:flutter/material.dart';
import 'features/welcome/view/welcome_screen.dart';

void main() {
  runApp(const TrackizerApp());
}

class TrackizerApp extends StatelessWidget {
  const TrackizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trackizer',
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFF1C1C23),
      ),
      home: const WelcomeScreen(),
    );
  }
}
