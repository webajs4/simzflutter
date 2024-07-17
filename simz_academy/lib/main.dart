import 'package:flutter/material.dart';
import 'package:simz_academy/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://nsnsqbbmcjzjadfrsieo.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zbnNxYmJtY2p6amFkZnJzaWVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEyMTcxOTEsImV4cCI6MjAzNjc5MzE5MX0.58_-T2tUxe9lKS-k3ysPDGLEYvn7NTl7hYKUBFFk8R8');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
