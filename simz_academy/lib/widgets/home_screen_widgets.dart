import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/functions/show_alert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Something To Do
class SomethingToDo extends StatelessWidget {
  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Widget buildIconButtonWithText(BuildContext context, IconData icon,
      String text, Widget screen, Color iconColor, Color backgroundColor) {
    return Column(
      children: [
        IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              backgroundColor,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          icon: Icon(
            icon,
            color: iconColor,
            weight: 700,
          ),
          onPressed: () {
            navigateToScreen(context, screen);
          },
        ),
        HomeUiHelper().customText(text, 16, FontWeight.w400, Colors.black),
      ],
    );
  }

  const SomethingToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//Live Now
class LiveNow extends StatefulWidget {
  const LiveNow({super.key});

  @override
  State<LiveNow> createState() => _LiveNowState();
}

class _LiveNowState extends State<LiveNow> {
  final livestream =
      Supabase.instance.client.from('live').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: livestream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //print('Stream is waiting for data...');
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          //print('Stream error: ${snapshot.error}');
          return const Center(child: Text('Error loading events'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //print('No data received from stream');
          return const Center(child: Text('No Events'));
        }

        final liveEvents = snapshot.data!;
        //print('Data received: $liveEvents');

        // Safely access the first live event
        final firstLiveEvent = liveEvents.isNotEmpty ? liveEvents[0] : null;
        final liveName = firstLiveEvent?['live_class'] ?? 'No Class Name';
        final livementor = firstLiveEvent?['mentor'] ?? 'No Mentor';
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(223, 183, 240, 1),
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      HomeUiHelper().customText('  Live Now', 15, FontWeight.w600,
                          const Color.fromRGBO(207, 35, 47, 1)),
                      const SizedBox(
                        height: 15,
                      ),
                      HomeUiHelper().customText("  $liveName", 28,
                          FontWeight.w600, const Color.fromRGBO(56, 15, 67, 1)),
                      const SizedBox(
                        height: 5,
                      ),
                      HomeUiHelper().customText("  $livementor", 18,
                          FontWeight.w400, const Color.fromRGBO(56, 15, 67, 1)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 155,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                const Color.fromRGBO(105, 42, 123, 1),
                              ),
                            ),
                            onPressed: () async {
                              final response = await Supabase.instance.client
                                  .from('live')
                                  .select('meet_url')
                                  .single();
                              var data = response['meet_url'];
                              showAlertBox(context, data);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                HomeUiHelper().customText(
                                  'Attend Live  ',
                                  16,
                                  FontWeight.w300,
                                  const Color.fromRGBO(242, 247, 253, 1),
                                ),
                                const Icon(
                                  Iconsax.voice_square,
                                  color: Color.fromRGBO(251, 246, 253, 1),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://images.pexels.com/photos/191240/pexels-photo-191240.jpeg?cs=srgb&dl=pexels-ferarcosn-191240.jpg&fm=jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//Upcoming

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final upcomingStream =
      Supabase.instance.client.from('upcoming').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: upcomingStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading events'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Events'));
        }
        final upcomingEvents = snapshot.data!;
        final firstUpcomingEvent =
            upcomingEvents.isNotEmpty ? upcomingEvents[0] : null;
        final upcomingClass =
            firstUpcomingEvent?['upcoming_class'] ?? 'No Class Name';
        final upcomingMentor =
            firstUpcomingEvent?['upcoming_mentor'] ?? 'No Mentor';
        final upcomingTime = firstUpcomingEvent?['upcoming_time'] ?? 'No Time';
        final upcomingDate = firstUpcomingEvent?['upcoming_date'] ?? 'No Date';
        // print(
        //   'Data received:'
        //   'Class: $upcomingClass'
        //   'Mentor: $upcomingMentor'
        //   'Time: $upcomingTime'
        //   'Date: $upcomingDate'
        // );
        return Center(
          child: InkWell(
            onTap: ()async{
              print(upcomingEvents); 
              String dateTimeString = '$upcomingDate $upcomingTime';
              try {
                //parse to datetime

                DateTime classTime = DateTime.parse(dateTimeString);
                print('Parsed DateTime: $classTime');

                //convert to milliseconds
                int timeInMillis = classTime.millisecondsSinceEpoch;
                final  androidUrl = "content://com.android.calendar/time/$timeInMillis";
                showAlertBox(context, androidUrl);
              }catch(e){
                print(e.toString());
              }
            },
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset('lib/assets/images/keyboard playing music.png'),
                  Positioned(
                    left: 30,
                    top: 30,
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(251, 246, 253, 1),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: HomeUiHelper().customText(
                              'Online',
                              14,
                              FontWeight.w600,
                              const Color.fromRGBO(126, 30, 37, 1))),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          HomeUiHelper().customText(
                            upcomingClass,
                            28,
                            FontWeight.w600,
                            const Color.fromRGBO(251, 246, 253, 1),
                          ),
                          HomeUiHelper().customText(
                            upcomingMentor,
                            18,
                            FontWeight.w400,
                            const Color.fromRGBO(251, 246, 253, 1),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.calendar,
                                color: Color.fromRGBO(251, 246, 253, 1),
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              HomeUiHelper().customText(
                                upcomingDate,
                                16,
                                FontWeight.w400,
                                const Color.fromRGBO(251, 246, 253, 1),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.clock,
                                color: Color.fromRGBO(251, 246, 253, 1),
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              HomeUiHelper().customText(
                                upcomingTime,
                                16,
                                FontWeight.w400,
                                const Color.fromRGBO(251, 246, 253, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Appreciations extends StatefulWidget {
  const Appreciations({super.key});

  @override
  State<Appreciations> createState() => _AppreciationsState();
}

class _AppreciationsState extends State<Appreciations> {
  final appreciationStream =
      Supabase.instance.client.from('appreciation').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: appreciationStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          //print('Stream error: ${snapshot.error}');
          return const Center(child: Text('Error loading appreciations'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Appreciations'));
        }

        final appreciations = snapshot.data!;

        return CarouselSlider(
          options: CarouselOptions(
            height: 170.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: appreciations.map((appreciation) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12),
                    color: const Color.fromRGBO(69, 10, 14, 0.19),
                  ),
                                        // appreciation['name'] ?? 'No Name',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset('lib/assets/images/simz_logo_2.png'),
                            HomeUiHelper().customText(' Simz ', 16, FontWeight.w600, const Color.fromRGBO(56, 15, 67, 1)),
                            HomeUiHelper().customText('Academy ', 16, FontWeight.w600, const Color.fromRGBO(27, 60, 95, 1)),
                            HomeUiHelper().customText('Excellence', 16, FontWeight.w600, const Color.fromRGBO(126, 30, 37, 1)),
                            const Icon(Iconsax.award,
                              color: Color.fromRGBO(91, 40, 103, 1),
                              size: 20,
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        HomeUiHelper().customText(appreciation['name'] ?? 'No Name', 20, FontWeight.w600, const Color.fromRGBO(56, 15, 67, 1),),
                        HomeUiHelper().customText(appreciation['description'] ?? 'No description', 14, FontWeight.w400, const Color.fromRGBO(56, 15, 67, 1),),
                        const SizedBox(height: 15,),
                        Row(
                          children: <Widget>[
                            const Expanded(child: SizedBox()),
                            Text('Congratulations',
                              style: GoogleFonts.architectsDaughter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(207, 35, 47, 1)
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  )
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
