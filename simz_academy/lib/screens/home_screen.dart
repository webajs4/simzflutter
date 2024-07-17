// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/screens/exam_screen.dart';
import 'package:simz_academy/screens/practise_screen.dart';
import 'package:simz_academy/screens/sheet_screen.dart';
import 'package:simz_academy/screens/syllabus_screen.dart';
import 'package:simz_academy/widgets/home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeUiHelper().customText(
              'Howdy',
              16,
              FontWeight.w300,
              Color.fromRGBO(56, 15, 67, 1.0),
            ),
            HomeUiHelper().customText(
              'Alan Jose Santo',
              24,
              FontWeight.w600,
              Color.fromRGBO(56, 15, 67, 1.0),
            )
          ],
        ),
        actions: [
          Row(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(236, 215, 247, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Iconsax.notification,
                      color: Color.fromRGBO(56, 15, 67, 1.0),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'lib/assets/images/person.png',
                fit: BoxFit.cover,
                scale: 1.1,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //main container
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(196, 220, 243, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //sub container heading
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Color.fromRGBO(28, 83, 136, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Iconsax.teacher5,
                              color: Color.fromRGBO(196, 220, 243, 1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            HomeUiHelper().customText(
                              'Learning Now',
                              15,
                              FontWeight.normal,
                              Color.fromRGBO(196, 220, 243, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          HomeUiHelper().customText(
                            'Grade 2',
                            15,
                            FontWeight.normal,
                            Color.fromRGBO(28, 83, 136, 1),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              HomeUiHelper().customText(
                                'Sky Boat Song',
                                24,
                                FontWeight.bold,
                                Color.fromRGBO(28, 83, 136, 1),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconsax.music_playlist,
                                  color: Color.fromRGBO(28, 83, 136, 1),
                                ),
                              ),
                            ],
                          ),
                          HomeUiHelper().customText(
                            'Musical Masterpiece composed by \nTraditional',
                            16,
                            FontWeight.w400,
                            Color.fromRGBO(18, 39, 63, 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              HomeUiHelper().customText(
                                  '48%  ',
                                  20,
                                  FontWeight.w600,
                                  Color.fromRGBO(18, 39, 63, 1)),
                              HomeUiHelper().customText(
                                  'Completed',
                                  15,
                                  FontWeight.w300,
                                  Color.fromRGBO(18, 39, 63, 1)),
                              Expanded(child: SizedBox()),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    Color.fromRGBO(36, 114, 186, 1),
                                  ),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // navigate to a required page --> lesson tracking
                                },
                                child: Text(
                                  'Track Lessons',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(242, 247, 253, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              HomeUiHelper().customText(
                'Something to do',
                28,
                FontWeight.w600,
                Color.fromRGBO(56, 15, 67, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SomethingToDo().buildIconButtonWithText(
                      context, Iconsax.bookmark, 'Syllabus', SyllabusScreen(),Color.fromRGBO(91, 40, 103, 1),Color.fromRGBO(236, 215, 247, 1)),
                  SomethingToDo().buildIconButtonWithText(
                      context, Iconsax.clipboard_text, 'Exam', ExamScreen(),Color.fromRGBO(126, 30, 37, 1),Color.fromRGBO(254, 202, 206, 1)),
                  SomethingToDo().buildIconButtonWithText(
                      context, Iconsax.music_square, 'Sheets', SheetScreen(),Color.fromRGBO(27, 60, 95, 1),Color.fromRGBO(196, 220, 243, 1)),
                  SomethingToDo().buildIconButtonWithText(
                      context, Iconsax.microphone_2, 'Practise', PractiseScreen(),Color.fromRGBO(91, 40, 103, 1),Color.fromRGBO(236, 215, 247, 1)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
