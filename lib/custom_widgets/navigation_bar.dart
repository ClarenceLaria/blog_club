import 'package:blog_club/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:blog_club/pages/home.dart';
import 'package:blog_club/pages/articles.dart';
import 'package:blog_club/pages/add_page.dart';
import 'package:blog_club/pages/menu_page.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});
  
  @override
  State<NavigationBarWidget> createState() {
    return _NavigationBarState();
  }
}

class _NavigationBarState extends State<NavigationBarWidget> {
  _NavigationBarState();

  int _selectedIndex = 0;

  // List of pages corresponding to each tab
  final List<Widget> _pages = [
    const Center(child: HomePage()),
    const Center(child: Articles()),
    const Center(child: AddPage()),
    const Center(child: MenuPage()),
    const Center(child: SettingsPage()),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 56, 106, 237),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}