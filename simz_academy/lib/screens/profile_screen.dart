import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Ensure you have the iconsax package added in pubspec.yaml
import 'package:simz_academy/UIHelper/home_ui_helper.dart'; // Ensure this path is correct

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Iconsax.arrow_square_left),
          color: Color.fromRGBO(56, 15, 67, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: HomeUiHelper().customText(
            'Sheets', 
            24, 
            FontWeight.w400, 
            Color.fromRGBO(56, 15, 67, 1)
          ),
        ),
      ),
      body: Center(
        child: Text('Profile Screen Content'),
      ),
    );
  }
}
