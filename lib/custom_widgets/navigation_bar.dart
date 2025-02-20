import 'package:blog_club/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:blog_club/pages/home.dart';
import 'package:blog_club/pages/add_page.dart';
import 'package:blog_club/pages/profile_page.dart';

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
    const Center(child: Text('Search Page')),
    const Center(child: AddPage()),
    const Center(child: ProfilePage()),
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
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
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
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
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
          Positioned(
            bottom: 20, 
            left: MediaQuery.of(context).size.width / 2 - 25, 
            child: GestureDetector(
              onTap: () {
                _onItemTapped(2); 
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255,56,106,237), // Background color
                  shape: BoxShape.circle, // Makes it circular
                  border: Border.all(color: Colors.white, width: 3), // Border color
                ),
                padding: const EdgeInsets.all(10), // Adjust size
                child: const Icon(Icons.add, color: Colors.white, size: 30,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}