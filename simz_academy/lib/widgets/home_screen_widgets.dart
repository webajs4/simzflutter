import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';

class SomethingToDo extends StatelessWidget {
  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Widget buildIconButtonWithText(
      BuildContext context, IconData icon, String text, Widget screen,Color iconColor,Color backgroundColor) {
    return Column(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              backgroundColor,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          icon: Icon(icon,
            color: iconColor,
            weight: 700,
            
          ),

          onPressed: () {
            navigateToScreen(context, screen);
          },
        ),
        HomeUiHelper().customText(text, 16, FontWeight.w400, Colors.black),
      ],
    );
  }

  const SomethingToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.bookmark),
          ),
          HomeUiHelper()
              .customText('Syllabus', 16, FontWeight.w400, Colors.black)
        ])
      ],
    );
  }
}
