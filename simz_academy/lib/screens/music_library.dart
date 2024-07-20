import 'package:flutter/material.dart';


class MusicLibraryScreen extends StatefulWidget {
  const MusicLibraryScreen({super.key});

  @override
  State<MusicLibraryScreen> createState() => _MusicLibraryScreenState();
}

class _MusicLibraryScreenState extends State<MusicLibraryScreen> {
  // int _selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text('Music Library'),
      ),
      
    );
  }
}