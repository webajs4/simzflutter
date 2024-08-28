import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/consumers/sheet_consumer.dart';

class SheetScreen extends StatelessWidget {
  const SheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Iconsax.arrow_square_left,
            color: Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
        title: Center(
          child: HomeUiHelper().customText(
              'Sheets', 24, FontWeight.w400, Color.fromRGBO(56, 15, 67, 1)),
        ),
        actions: const [
          SizedBox(
            width: 60,
            height: 40,
          ),
        ],
      ),
      body: const Center(child: SheetConsumer()),
    );
  }
}
