import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
//import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/login_screen.dart';
import 'package:simz_academy/screens/no_internet.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {

  SplashScreen({super.key});

  bool networkState = false;

  @override
  Widget build(BuildContext context) {
    checkNetwork();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (networkState==true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NoInternet()),
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          'lib/assets/images/splash_screen.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> checkNetwork() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      //mobile data available
      networkState = true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      networkState = true;
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      networkState = true;
      // Ethernet connection available.
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      networkState = true;
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else {
      //No internet connection
      networkState = false;
    }
    //print(networkState);
  }
}