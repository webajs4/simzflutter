import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart'; // Ensure you have the iconsax package added in pubspec.yaml
//import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/constants/supabase_functions.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:simz_academy/screens/login_screen.dart';
import 'package:simz_academy/widgets/common_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _launchURL(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(
            uri,
            mode: LaunchMode.inAppWebView,
          );
        } else {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Iconsax.logout, color: Color.fromRGBO(56, 15, 67, 1)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: HomeUiHelper().customText(
                      "Are you sure want to logout?",
                      26,
                      FontWeight.w600,
                      Color.fromRGBO(56, 15, 67, 1),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: HomeUiHelper().customText(
                          "Cancel",
                          20,
                          FontWeight.w400,
                          Color.fromRGBO(56, 15, 67, 1),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Color.fromRGBO(56, 15, 67, 1)),
                          foregroundColor: WidgetStateProperty.all<Color>(
                              Color.fromRGBO(251, 246, 253, 1)),
                        ),
                        onPressed: () {
                          // Logout user and goto Login and to remove all the previous pages
                          Supabase.instance.client.auth.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: HomeUiHelper().customText(
                          "Logout",
                          20,
                          FontWeight.w400,
                          Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  );
                },
              );
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //SizedBox(width: 16.0),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Will be available soon",
                                maxLines: 3,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                      color: Color.fromRGBO(
                                          56, 15, 67, 1), // Set the text color
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          HomeUiHelper().customText(
                            'Edit Profile  ',
                            16,
                            FontWeight.w400,
                            Color.fromRGBO(56, 15, 67, 1),
                          ),
                          Icon(
                            Iconsax.edit,
                            color: Color.fromRGBO(56, 15, 67, 1),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                HomeUiHelper().customText("Your Courses", 20, FontWeight.w600,
                    Color.fromRGBO(56, 15, 67, 1)),
                SizedBox(height: 16.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                                color: Color.fromRGBO(
                                                    27, 60, 95, 1),
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

// Badges gained section below  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

                SizedBox(height: 16.0),
                HomeUiHelper().customText("Badges Gained", 20, FontWeight.w600,
                    Color.fromRGBO(56, 15, 67, 1)),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              // Do something when the user taps on the badge
                            },
                            child: Column(
                              children: const [
                                Image(
                                  image:
                                      AssetImage('lib/assets/images/award.png'),
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                Text(
                                  'Amethyst \nApprentice',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(27, 60, 95, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),

// Badges gained section above  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// Certificates earned section below  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

                SizedBox(height: 16.0),
                HomeUiHelper().customText("Certificates Earned", 20,
                    FontWeight.w600, Color.fromRGBO(56, 15, 67, 1)),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Do something when the user taps on the badge
                            },
                            child: Column(
                              children: const [
                                Image(
                                  image: AssetImage(
                                      'lib/assets/images/document-download.png'),
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: Text(
                                    'Trinity Certificate Keyboard',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(27, 60, 95, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Do something when the user taps on the badge
                            },
                            child: Column(
                              children: const [
                                Image(
                                  image: AssetImage(
                                      'lib/assets/images/document-download.png'),
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: Text(
                                    'Simz Excellence Certificate',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(27, 60, 95, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Do something when the user taps on the badge
                            },
                            child: Column(
                              children: const [
                                Image(
                                  image: AssetImage(
                                      'lib/assets/images/document-download.png'),
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                SizedBox(
                                  width: 100.0,
                                  child: Text(
                                    'Guitar Tuna Competition blah blah blah',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(27, 60, 95, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),

// Certificates earned section above  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// instant support and connected with us section below  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

                SizedBox(height: 16.0),
                Center(
                  child: HomeUiHelper().customText(
                      "        Get instant support from our team ! \nChat with instructors anytime, anywhere !",
                      14,
                      FontWeight.w600,
                      Color.fromRGBO(56, 15, 67, 1)),
                ),
                SizedBox(height: 32.0),
                Container(
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeUiHelper().customText("Stay connected with us !", 24,
                          FontWeight.w600, Color(0xFF380F43)),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => _launchURL(
                                Uri.parse(
                                    'https://www.facebook.com/simzacademy/'),
                                false),
                            child: Image(
                              image:
                                  AssetImage('lib/assets/images/facebook.png'),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          InkWell(
                            onTap: () => _launchURL(
                                Uri.parse('https://simzmuzic.com/'), false),
                            child: Image(
                              image:
                                  AssetImage('lib/assets/images/discord.png'),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          InkWell(
                            onTap: () => _launchURL(
                                Uri.parse(
                                    'https://www.instagram.com/simzacademy/'),
                                false),
                            child: Image(
                              image:
                                  AssetImage('lib/assets/images/instagram.png'),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          InkWell(
                            onTap: () => _launchURL(
                                Uri.parse(
                                    'https://api.whatsapp.com/send/?phone=917907386458&text=Hello+Simz+Academy%2C+I+would+like+to+know+more+about+your+courses.&type=phone_number&app_absent=0'),
                                false),
                            child: Image(
                              image:
                                  AssetImage('lib/assets/images/whatsapp.png'),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),

                //contact us section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeUiHelper().customText(
                        'Contact Us', 20, FontWeight.w600, Color(0xFF380F43)),
                    SizedBox(height: 10.0),
                    InkWell(
                        onTap: () =>
                            _launchURL(Uri.parse('tel:+919072397378'), false),
                        child: HomeUiHelper().customText(
                            'Phone : +919072397378',
                            16,
                            FontWeight.w400,
                            Color(0xFF380F43))), //phone
                    InkWell(
                        onTap: () => _launchURL(
                            Uri.parse('mailto:simzzacademy@gmail.com'), false),
                        child: HomeUiHelper().customText(
                            'Email: simzzacademy@gmail.com',
                            16,
                            FontWeight.w400,
                            Color(0xFF380F43))), //email
                    HomeUiHelper().customText(
                        'Address : 123 Learning Lane,\nKnowledge city',
                        16,
                        FontWeight.w400,
                        Color(0xFF380F43)), //address
                    HomeUiHelper().customText(
                        'Working Hours : Mon-Fri: 9AM - 5PM',
                        16,
                        FontWeight.w400,
                        Color(0xFF380F43)),
                  ],
                ),
                FooterWidget(),
              ],
            ),
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
