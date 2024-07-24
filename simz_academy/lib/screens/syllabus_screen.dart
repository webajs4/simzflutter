import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/consumers/syllabus_consumer.dart';
import 'package:simz_academy/screens/bottom_nav.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: HomeUiHelper().customText('Syllabus', 24, FontWeight.w400,
                const Color.fromRGBO(56, 15, 67, 1))),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return BottomNav();
            }));
          },
          icon: const Icon(
            (Iconsax.arrow_square_left),
            color: Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset('lib/assets/images/person.png'),
          ),
        ],
      ),
      body: SyllabusConsumer(),
    );
  }
}