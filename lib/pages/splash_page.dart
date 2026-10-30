import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF00897B);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: warnaUtama,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.edit_note,
                size: 64,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Harianku',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: warnaUtama,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Catat setiap hari, ingat setiap momen.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 40),
            const SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                color: warnaUtama,
                backgroundColor: Color(0xFFB2DFDB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}