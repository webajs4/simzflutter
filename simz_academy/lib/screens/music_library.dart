import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/screens/bottom_nav.dart';

class MusicLibraryScreen extends StatefulWidget {
  const MusicLibraryScreen({super.key});

  @override
  State<MusicLibraryScreen> createState() => MusicLibraryScreenState();
}

class MusicLibraryScreenState extends State<MusicLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_square_left,
              color: Color.fromRGBO(56, 15, 67, 1)),
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return BottomNav();
            }));
          },
        ),
        title: Center(
            child: HomeUiHelper().customText('Recorded Classes', 24,
                FontWeight.w400, Color.fromRGBO(56, 15, 67, 1))),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Classes',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(205, 140, 230, 1),
                ),
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: Color.fromRGBO(205, 140, 230, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(246, 235, 252, 1),
                  ),
                ),
                fillColor: Color.fromRGBO(246, 235, 252, 1),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              width: 365,
              height: 101,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                gradient: RadialGradient(
                  colors: const [
                    Color.fromRGBO(129, 50, 153, 1),
                    Color.fromRGBO(205, 140, 230, 1),
                  ],
                  center: Alignment.center,
                  radius: 3,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Image.asset('lib/assets/images/Saly-13.png'),
                  SizedBox(
                    width: 30,
                  ),
                  HomeUiHelper().customText(
                    'Unleash Your Musical\nTalent Anytime, \nAnywhere!',
                    20,
                    FontWeight.w600,
                    Color(0xFFFBF6FD),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Color.fromRGBO(181, 95, 214, 1),
            indent: 90,
            endIndent: 90,
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
