// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                ]),
                //main container
                Center(
                  child: Container(
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                        context,
                        // make the icons bold
                        IconsaxPlusBold.book,
                        'Syllabus',
                        SyllabusScreen(),
                        Color.fromRGBO(91, 40, 103, 1),
                        Color.fromRGBO(236, 215, 247, 1)),
                    SomethingToDo().buildIconButtonWithText(
                        context,
                        IconsaxPlusBold.clipboard_text,
                        'Exam',
                        ExamScreen(),
                        Color.fromRGBO(126, 30, 37, 1),
                        Color.fromRGBO(254, 202, 206, 1)),
                    SomethingToDo().buildIconButtonWithText(
                        context,
                        IconsaxPlusBold.music_square,
                        'Sheets',
                        SheetScreen(),
                        Color.fromRGBO(27, 60, 95, 1),
                        Color.fromRGBO(196, 220, 243, 1)),
                    SomethingToDo().buildIconButtonWithText(
                        context,
                        IconsaxPlusBold.microphone_2,
                        'Practise',
                        PractiseScreen(),
                        Color.fromRGBO(91, 40, 103, 1),
                        Color.fromRGBO(236, 215, 247, 1)),
                  ],
                ),
                HomeUiHelper().customText('Live Class', 28, FontWeight.w600,
                    Color.fromRGBO(56, 15, 67, 1)),
                LiveNow(),
                const SizedBox(
                  height: 5,
                ),
                HomeUiHelper().customText('Upcoming', 28, FontWeight.w600,
                    Color.fromRGBO(56, 15, 67, 1)),
                Upcoming(),
                HomeUiHelper().customText('Appreciations', 28, FontWeight.w600,
                    Color.fromRGBO(56, 15, 67, 1)),
                Appreciations(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('lib/assets/images/simz_logo_2.png'),
                            HomeUiHelper().customText(
                                ' Simz ',
                                16,
                                FontWeight.w600,
                                const Color.fromRGBO(56, 15, 67, 1)),
                            HomeUiHelper().customText(
                                'Academy ',
                                16,
                                FontWeight.w600,
                                const Color.fromRGBO(27, 60, 95, 1)),
                          ],
                        ),
                        HomeUiHelper().customText('v1.0.2024', 16,
                            FontWeight.w300, Color.fromRGBO(105, 42, 123, 1)),
                        HomeUiHelper().customText(
                            'Developed By Team AJS Web Creatives',
                            16,
                            FontWeight.w300,
                            Color.fromRGBO(105, 42, 123, 1)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 450),
            index: _selectedIndex,
            color: Color.fromRGBO(246, 235, 252, 1),
            backgroundColor: Color.fromRGBO(236, 215, 247, 1),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              bottomNavIcon(Iconsax.home_2, 0),
              bottomNavIcon(Iconsax.music_library_2, 1),
              bottomNavIcon(Iconsax.book, 2),
              bottomNavIcon(Iconsax.empty_wallet, 3),
              bottomNavIcon(Iconsax.user, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavIcon(
    IconData iconData,
    int index,
  ) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Color.fromRGBO(91, 40, 103, 1) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: isSelected ? Colors.white : Color.fromRGBO(91, 40, 103, 1),
      ),
    );
  }
  // Widget bottomNavSpecialIcon(IconData iconData, int index, ) {
  //   bool isSelected = _selectedIndex == index;
  //   return Container(
  //     padding: EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: isSelected ? Color.fromRGBO(254, 242, 243, 1) : Color.fromRGBO(91, 40, 103, 1),//Color.fromRGBO(238, 69, 81, 1),
  //       shape: BoxShape.circle,
  //     ),
  //     child: Icon(
  //       iconData,
  //       color: isSelected ? Color.fromRGBO(91, 40, 103, 1) : Color.fromRGBO(254, 242, 243, 1),
  //     ),
  //   );
  // }
}
