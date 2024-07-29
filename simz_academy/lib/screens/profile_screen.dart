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
            Color.fromRGBO(56, 15, 67, 1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeUiHelper().customText(
              'Student details',
              20,
              FontWeight.w600,
              Color.fromRGBO(56, 15, 67, 1),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/image.png'), // Ensure the image is in the assets folder
              ),
              title: HomeUiHelper().customText(
                'Student',
                18,
                FontWeight.w500,
                Color.fromRGBO(56, 15, 67, 1),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeUiHelper().customText(
                    'ID: 123456',
                    14,
                    FontWeight.w400,
                    Color.fromRGBO(56, 15, 67, 1),
                  ),
                  SizedBox(height: 4.0),
                  HomeUiHelper().customText(
                    'Email: student@example.com',
                    14,
                    FontWeight.w400,
                    Color.fromRGBO(56, 15, 67, 1),
                  ),
                  SizedBox(height: 4.0),
                  HomeUiHelper().customText(
                    'Phone number: (123) 456-7890',
                    14,
                    FontWeight.w400,
                    Color.fromRGBO(56, 15, 67, 1),
                  ),
                ],
              ),
            ),
            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
