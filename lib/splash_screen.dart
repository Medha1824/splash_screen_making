import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _pawController;
  late AnimationController _lettersController;
  late Animation<double> _pawAnimation;
  final String appName = "FluffyGo";

  @override
  void initState() {
    super.initState();

    _pawController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );
    _pawAnimation = Tween<double>(
      begin: -250,
      end: 0,
    ).animate(CurvedAnimation(parent: _pawController, curve: Curves.bounceOut));
    _pawController.forward();

    _lettersController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _pawController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 200), () {
          _lettersController.forward();
        });
      }
    });

    Timer(const Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyHomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  @override
  void dispose() {
    _pawController.dispose();
    _lettersController.dispose();
    super.dispose();
  }

  Widget animatedLetter(String letter, int index) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _lettersController,
          curve: Interval(index * 0.1, 1.0, curve: Curves.elasticOut),
        ),
      ),
      child: Text(
        letter,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3DAD8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _pawAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _pawAnimation.value),
                  child: child,
                );
              },
              child: Image.asset('Photo/photo1.png', width: 120, height: 120),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                appName.length,
                (index) => animatedLetter(appName[index], index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
