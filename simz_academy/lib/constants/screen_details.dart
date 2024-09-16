import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the methods inside the build method
    double screenWidth = getScreenWidth(context);
    double screenHeight = getScreenHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Dimensions Example'),
      ),
      body: Center(
        child: Text('Screen width: $screenWidth, Screen height: $screenHeight'),
      ),
    );
  }

  // Function to get screen width
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Function to get screen height
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
