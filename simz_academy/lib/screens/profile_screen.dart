import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Ensure you have the iconsax package added in pubspec.yaml
import 'package:simz_academy/UIHelper/home_ui_helper.dart'; // Ensure this path is correct

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: const [
                    Color.fromRGBO(56, 15, 67, 0.1),
                    Color.fromRGBO(56, 15, 67, 0.5),
                  ],
                  radius: 0.8,
                  ),
              ),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color.fromRGBO(56, 15, 67, 1),
                      width: 2,
                    ),
                  ),
                  // child: Image.asset(
                  //     'simzflutter/simz_academy/lib/assets/images/person.png')
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
            ),
            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
