import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const HarianApp());
}

class HarianApp extends StatelessWidget {
  const HarianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harianku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00897B),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAFAF5),
      ),
      home: const SplashPage(),
    );
  }
}