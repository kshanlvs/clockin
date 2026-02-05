import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    await Future.delayed(const Duration(seconds: 3));


        context.go('/login');
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2F36),
      body: Center(
        child: Image.asset('assets/logo.png', width: 200),
      ),
    );
  }
}
