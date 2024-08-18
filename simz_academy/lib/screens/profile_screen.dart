import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart'; // Ensure you have the iconsax package added in pubspec.yaml
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/supabase_functions.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Ensure this path is correct

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Iconsax.logout, color: Color.fromRGBO(56, 15, 67, 1)),
            onPressed: (){
              Supabase.instance.client.auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Iconsax.arrow_square_left),
          color: Color.fromRGBO(56, 15, 67, 1),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BottomNav(),
            ));
          },
        ),
        title: Center(
          child: HomeUiHelper().customText(
            'Profile',
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
                          SizedBox(
                            width: 200.0,
                            child: HomeUiHelper().customText(
                              getCurrentUserName(),
                              32,
                              FontWeight.w600,
                              Color.fromRGBO(251, 246, 253, 1),
                            ),
                          ),

                          SizedBox(
                            width: 200.0,
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              getCurrentUserId(context),
                              style: GoogleFonts.blinker( 
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(251, 246, 253, 1),
                              ),
                            ),
                          ),
                          HomeUiHelper().customText(
                            getCurrentUserEmail(),
                            16,
                            FontWeight.w400,
                            Color.fromRGBO(251, 246, 253, 1),
                          ),
                          HomeUiHelper().customText(
                            getCurrentUserPhone(),
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
                          return SizedBox(
                            width: 363.0,
                            child: Container(
                              margin: EdgeInsets.only(right: 16.0),
                              width: 412.0,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 230.0,
                                          child: Text(
                                            'Scales and Theory of KeyBoard',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color.fromRGBO(27, 60, 95, 1),
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        HomeUiHelper().customText(
                                            '12 Lessons',
                                            20,
                                            FontWeight.w300,
                                            Color.fromRGBO(27, 60, 95, 1)),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    'lib/assets/images/sheets.png',
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ],
                              ),
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

  String getCurrentUserPhone() {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser?.userMetadata!['phone'];
    //print(user);
    return user ?? 'No phone number found';
  }
}
