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
      body: Center(
        child: Padding(
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
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  gradient: RadialGradient(
                    colors: const [
                      Color.fromRGBO(56, 15, 67, 1),
                      Color.fromRGBO(91, 40, 103, 1),
                    ],
                    radius: 0.8,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('lib/assets/images/person.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeUiHelper().customText(
                            'Alan Jose Santo',
                            32,
                            FontWeight.w600,
                            Color.fromRGBO(251, 246, 253, 1),
                          ),
                          HomeUiHelper().customText(
                            'simzacademy829347',
                            16,
                            FontWeight.w400,
                            Color.fromRGBO(251, 246, 253, 1),
                          ),
                          HomeUiHelper().customText(
                            'abc@test.com',
                            16,
                            FontWeight.w400,
                            Color.fromRGBO(251, 246, 253, 1),
                          ),
                          HomeUiHelper().customText(
                            '28349242902',
                            16,
                            FontWeight.w400,
                            Color.fromRGBO(251, 246, 253, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              HomeUiHelper().customText("Your Courses", 20, FontWeight.w600,
                  Color.fromRGBO(56, 15, 67, 1)),
              SizedBox(
                height:
                    120.0, // Specify a fixed height for the CustomScrollView
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.0),
                            width: 425.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Color.fromRGBO(196, 220, 243, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 300.0,
                                        child: Text(
                                          'Scales and Theory of KeyBoard',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(27, 60, 95, 1),
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      HomeUiHelper().customText('12 Lessons', 20, FontWeight.w300, Color.fromRGBO(27, 60, 95, 1)),
                                    ],
                                  ),
                                ),
                                Image.asset('lib/assets/images/sheets.png',
                                    width: 100.0, height: 100.0,
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
