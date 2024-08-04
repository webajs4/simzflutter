import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simz_academy/screens/course_screen.dart';
import 'package:simz_academy/screens/fee_screen.dart';
import 'package:simz_academy/screens/home_screen.dart';
import 'package:simz_academy/screens/music_library.dart';
import 'package:simz_academy/screens/profile_screen.dart';

/// A stateful widget that displays a bottom navigation bar with five tabs.
class BottomNav extends StatefulWidget {
  const BottomNav({super.key,});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

/// The state of the [BottomNav] widget.
class _BottomNavState extends State<BottomNav> {

  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const <Widget>[
          HomeScreen(),
          MusicLibraryScreen(),
          CourseScreen(),
          FeeScreen(),
          ProfileScreen(key: null,),
        ],
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
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 450),
            index: _selectedIndex,
            color: const Color.fromRGBO(246, 235, 252, 1),
            backgroundColor: const Color.fromRGBO(236, 215, 247, 1),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _pageController.jumpToPage(index);
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

  /// Returns a widget that represents a bottom navigation bar icon.
  ///
  /// [iconData] The icon data to be displayed.
  /// [index] The index of the icon in the navigation bar.
  ///
  /// Example:
  /// ```dart
  /// bottomNavIcon(Iconsax.home_2, 0)
  /// ```
  Widget bottomNavIcon(IconData iconData, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromRGBO(91, 40, 103, 1)
            : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: isSelected ? Colors.white : const Color.fromRGBO(91, 40, 103, 1),
      ),
    );
  }
}