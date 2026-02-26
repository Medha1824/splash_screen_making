import 'package:flutter/material.dart';
import 'package:splash_screen_making/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA3DAD8),
        centerTitle: true,
        leading: Icon(Icons.pets, color: Colors.white, size: 26),
        title: Text(
          'FluffyGo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Page of my name Medha tame',
              style: TextStyle(
                color: Color(0xFFFFB6B9),
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontFamily: "Roboto",
              ),
            ),
            Text(
              'FluffyGo',
              style: TextStyle(
                color: Color(0xFFFFB6B9),
                fontSize: 27,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.pets, size: 40, color: Color(0xFFFFB6B9)),
          ],
        ),
      ),
    );
  }
}
