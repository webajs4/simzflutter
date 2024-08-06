import 'package:flutter/material.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(); // emailController variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),

            //Login image
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 216,
                width: 215,
                child: Image.asset(
                  'lib/assets/images/login.png',
                ),
              ),
            ),

            //Login text
            HomeUiHelper().customText(
              'LOGIN',
              36,
              FontWeight.w600,
              Color(0xFF380F43),
            ),

            //Login form
            const SizedBox(
              height: 20,
            ),
            HomeUiHelper().customText('Email Address', 16,FontWeight.w600,Color(0xFF380F43)),
            TextField(
              controller: emailController,
            ),
          ],
        ),
      ),
    );
  }
}
