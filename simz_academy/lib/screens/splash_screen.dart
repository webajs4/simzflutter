import 'package:flutter/material.dart';
import 'package:simz_academy/screens/bottom_nav.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
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
