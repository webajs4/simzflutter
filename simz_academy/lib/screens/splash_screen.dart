import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
//import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/login_screen.dart';
import 'package:simz_academy/screens/no_internet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
        if (networkState == true) {
          if (!checkUserSignIn()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BottomNav()),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NoInternet()),
          );
        }
      },
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [
              Color.fromRGBO(254, 202, 206, 1), // rgba(254, 202, 206, 1)
              Colors.white, // white in the center
              Color.fromRGBO(196, 220, 243, 1), // rgba(196, 220, 243, 1)
            ],
            stops: const [0.0, 0.5, 1.0], // Control color spread
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/images/simz_logo.png",
                fit: BoxFit.fill,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  HomeUiHelper().customText('Simz ', 32, FontWeight.w600, Color(0xFF380F43),),
                  HomeUiHelper().customText('Academy', 32, FontWeight.w600, Color(0xFF1B3C5F),),
                ],
              ),
            ],
          ),
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

  bool checkUserSignIn() {
    final Session? session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      return false;
    } else {
      return true;
    }
  }
}
