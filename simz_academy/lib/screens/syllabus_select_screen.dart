import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../UIHelper/home_ui_helper.dart';
import 'bottom_nav.dart';

class SyllabusSelectScreen extends StatelessWidget {
  const SyllabusSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: HomeUiHelper().customText('Syllabus', 24, FontWeight.w400,
                const Color.fromRGBO(56, 15, 67, 1))),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return BottomNav();
            }));
          },
          icon: Icon(
            (Iconsax.arrow_square_left),
            color: const Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
        actions: const [
          SizedBox(
            width: 60,
            height: 40,
          ),
        ],
      ),
    );
  }
}
