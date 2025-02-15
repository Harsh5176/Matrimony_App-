import 'package:flutter/material.dart';
import '../colortheme.dart';
import 'AboutUs.dart';
import 'AddUser.dart';
import 'Favourite.dart';
import 'HomePage.dart';
import 'UserList.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    Homepage(),
    AddUser(),
    UserList(),
    Favourite(),
    AboutUs()
  ];

  final List<String> _titles = [
    'Home',
    'Add User',
    'User List',
    'Favourite',
    'About Us',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
        _pageController.jumpToPage(0);
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex]),
          backgroundColor: AppColors.primary,
          leading: _selectedIndex != 0
              ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
                _pageController.jumpToPage(0);
              });
            },
          )
              : null,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _screens.map((screen) {
            return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (_selectedIndex != 0) {
                  setState(() {
                    _selectedIndex = 0;
                    _pageController.jumpToPage(0);
                  });
                }
              },
              child: screen,
            );
          }).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Add User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'User List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About Us',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.surface,
          backgroundColor: AppColors.background,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
