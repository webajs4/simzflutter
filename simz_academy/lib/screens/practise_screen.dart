import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/consumers/practise_consumers.dart';

class PractiseScreen extends StatelessWidget {
  const PractiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_square_left, color: Color.fromRGBO(56, 15, 67, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: HomeUiHelper().customText('Practice', 24, FontWeight.w400, Color.fromRGBO(56, 15, 67, 1))),
        actions: const [
          SizedBox(
            width: 60,
            height: 40,
          ),
        ],
      ),
      body: const Center(
        child: Center(
          child: PractiseConsumers(),
        ),
      ),
    );
  }
}
