import 'package:flutter/material.dart';
import 'package:simz_academy/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Image.asset('lib/assets/images/splash_screen.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
