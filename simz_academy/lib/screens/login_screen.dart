import 'package:flutter/material.dart';
import 'package:simz_academy/widgets/login_widgets.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).size.width > 800 ? LoginLargeScreen() : LoginSmallScreen(),
    );
  }
}