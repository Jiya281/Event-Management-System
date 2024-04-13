import 'dart:async';
import 'package:event_city/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(253, 255, 255, 255),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'assets/logo2.jpg',
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
      ),
    );
  }
}
