import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/UIHelper/home_ui_helper.dart';
import 'package:simz_academy/UIHelper/music_library_helper.dart';
import 'package:simz_academy/screens/bottom_nav.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MusicLibraryScreen extends StatefulWidget {
  const MusicLibraryScreen({super.key});

  @override
  State<MusicLibraryScreen> createState() => MusicLibraryScreenState();
}

class MusicLibraryScreenState extends State<MusicLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    final music = Supabase.instance.client
        .from('music_library')
        .stream(primaryKey: ['id']);
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
        actions:const  [
          SizedBox(
            width: 60,
            height: 40,
          )
        ],
        //backgroundColor: Color.fromRGBO(246, 235, 252, 1),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
              SizedBox(
                height: 5,
              ),
              HomeUiHelper().customText(
                  'Play and Learn', 20, FontWeight.w600, Color(0xFF380F43)),
              SizedBox(
                height: 5,
              ),
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: music,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error fetching data'),
                    );
                  } else if (snapshot.data == null) {
                    return Center(
                      child: Text('No data available'),
                    );
                  } else {
                    final musicData = snapshot.data!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: musicData.length,
                      itemBuilder: (context, index) {
                        final videoId = YoutubePlayer.convertUrlToId(
                            musicData[index]['music_url']);
                        //print(videoId);
                        return InkWell(
                          onTap: () {
                            showAlert(context, videoId);
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            //   return VideoPlayer(videoUrl: videoId, title: musicData[index]['music_title']);
                            // }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 363,
                                    height: 224,
                                    decoration: BoxDecoration(
                                        //color: Color.fromRGBO(246, 235, 252, 1),
                                        ),
                                    child: Image.network(
                                      YoutubePlayer.getThumbnail(
                                          videoId: videoId!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.00,
                                  child: Container(
                                    width: 363,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 0.4),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              HomeUiHelper().customText(
                                                musicData[index]['music_title'],
                                                24,
                                                FontWeight.w700,
                                                Color(0xFFFBF6FD),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Iconsax.clock,
                                                    color: Color(0xFFFBF6FD),
                                                    size: 14,
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  HomeUiHelper().customText(
                                                    musicData[index]
                                                        ['music_duration'],
                                                    14,
                                                    FontWeight.w600,
                                                    Color(0xFFFBF6FD),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              HomeUiHelper().customText(
                                                musicData[index]
                                                    ['music_instructor'],
                                                18,
                                                FontWeight.w700,
                                                Color(0xFFFBF6FD),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  HomeUiHelper().customText(
                                                    musicData[index]
                                                            ['music_lessons']
                                                        .toString(),
                                                    14,
                                                    FontWeight.w600,
                                                    Color(0xFFFBF6FD),
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  HomeUiHelper().customText(
                                                    'lessons',
                                                    14,
                                                    FontWeight.w600,
                                                    Color(0xFFFBF6FD),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
