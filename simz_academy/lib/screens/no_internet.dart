import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/screens/splash_screen.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'lib/assets/animations/no_internet.json',
              width: 200,
              height: 150,
              fit: BoxFit.fill,
            ),
            HomeUiHelper().customText('No Internet', 24, FontWeight.w600,
                Color.fromRGBO(56, 15, 67, 1)),
            HomeUiHelper().customText(
                'Please check your internet connection and try again',
                16,
                FontWeight.w400,
                Color.fromRGBO(56, 15, 67, 1)),
            SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    Color.fromRGBO(236, 215, 247, 1)),
                //padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: HomeUiHelper().customText(
                  'Retry', 16, FontWeight.w600, Color.fromRGBO(56, 15, 67, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
