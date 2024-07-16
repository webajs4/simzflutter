// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';

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
              customText(
                'Howdy',
                16,
                FontWeight.w300,
                Color.fromRGBO(56, 15, 67, 1.0),
              ),
              customText(
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
                Container(
                  child: Image.asset(
                    'lib/assets/images/person.png',
                    fit: BoxFit.cover,
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
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
                                customText(
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
                              customText(
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
                                  customText(
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
                              customText('Musical Masterpiece composed by \nTraditional', 16, FontWeight.w400, Color.fromRGBO(18, 39, 63, 1),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  customText('48%  ', 20, FontWeight.w600, Color.fromRGBO(18, 39, 63, 1)),
                                  customText('Completed', 15, FontWeight.w300, Color.fromRGBO(18, 39, 63, 1)),
                                  Expanded(child: SizedBox()),
                                  ElevatedButton(
                                    
                                    onPressed: () {
                                      // navigate to a required page --> lesson tracking
                                    },
                                    child: Text('Track Lessons',
                                      // style: TextStyle(
                                      //   fontsize: 15,
                                      //   fontweight: FontWeight.w300,
                                      //   color: Color.fromRGBO(18, 39, 63, 1),
                                      // ),
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
              ],
            ),
          ),
        ));
  }
}
