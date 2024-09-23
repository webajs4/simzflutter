import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../MediaPlayers/video_player.dart';

class TestSearchScreen extends StatefulWidget {
  const TestSearchScreen({super.key});

  @override
  State<TestSearchScreen> createState() => _TestSearchScreenState();
}

class _TestSearchScreenState extends State<TestSearchScreen> {
  final SupabaseClient _supabase = Supabase.instance.client;
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _videoNames = [];
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _fetchVideos(); // Fetch all videos on screen load
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
      _fetchVideos(); // Fetch videos based on search input
    });
  }

  Future<void> _fetchVideos() async {
    try {
      final response = await _supabase
          .from('test_video_player')
          .select('*')
          .ilike('video_name', '%$_searchText%'); // Search with text filter

      setState(() {
        _videoNames = response as List<dynamic>;
      });
        } catch (e) {
      // Handle exception
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField for search input
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Videos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Display the List of video names
            Expanded(
              child: _videoNames.isEmpty
                  ? const Center(child: Text('No videos found'))
                  : ListView.builder(
                itemCount: _videoNames.length,
                itemBuilder: (context, index) {

                  return ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return VideoPlayerScreen(
                          videoUrl: _videoNames[index]['video_url'].toString(),
                          videoDesc: _videoNames[index]['video_description'].toString(),
                        );
                      }));
                    },
                    title: Text('${_videoNames[index]['video_name']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
