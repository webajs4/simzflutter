import 'package:flutter/material.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  Widget footer(BuildContext context) {
    return 
      SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('lib/assets/images/simz_logo_2.png'),
                        HomeUiHelper().customText(' Simz ', 16, FontWeight.w600,
                            const Color.fromRGBO(56, 15, 67, 1)),
                        HomeUiHelper().customText('Academy ', 16, FontWeight.w600,
                            const Color.fromRGBO(27, 60, 95, 1)),
                      ],
                    ),
                    HomeUiHelper().customText('v1.0.2024', 16, FontWeight.w300,
                        const Color.fromRGBO(105, 42, 123, 1)),
                    HomeUiHelper().customText(
                        'Developed By Team AJS Web Creatives',
                        16,
                        FontWeight.w300,
                        const Color.fromRGBO(105, 42, 123, 1)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return FooterWidget().footer(context);
  }
}
