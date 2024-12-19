import 'package:auto_aid/pages/navigation/accountscreen.dart';
import 'package:auto_aid/pages/navigation/emergencyandhelp.dart';
import 'package:auto_aid/pages/navigation/home/homescreen.dart';
import 'package:auto_aid/pages/navigation/helpscreen.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

enum _SelectedTab { home, person, emergency, help }

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var _selectedTab = _SelectedTab.home;
  int _index = 0;

  void _handleIndex(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      _index = _SelectedTab.values.indexOf(_selectedTab);
    });
  }

  final List<CrystalNavigationBarItem> items = [
    CrystalNavigationBarItem(
      icon: IconlyBold.home,
    ),
    CrystalNavigationBarItem(
      icon: IconlyBold.profile,
    ),
    CrystalNavigationBarItem(
      icon: IconlyBold.danger,
    ),
    CrystalNavigationBarItem(
      icon: IconlyBold.info_circle,
    ),
  ];

  Widget? _buildPage() {
    if (_index == 0) {
      return Homescreen();
    } else if (_index == 1) {
      return Accountscreen();
    } else if (_index == 2) {
      return Emergencyandhelp();
    } else if (_index == 3) {
      return Helpscreen();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(
        children: [_buildPage() ?? SizedBox.shrink()],
      ),
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndex,
        items: items,
        backgroundColor: Colors.black.withOpacity(0.1),
        selectedItemColor: Color.fromRGBO(42, 76, 150, 1),
        unselectedItemColor: Colors.black,
        borderRadius: 20,
      ),
    );
  }
}
