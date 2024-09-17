import 'package:flutter/material.dart';
import 'package:simz_academy/constants/screen_details.dart';

import '../widgets/signup_widgets.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenDetails().getScreenWidth(context) > 800 ? SignUpLargeScreen() : SignUpSmallScreen(),
    );
  }
}
