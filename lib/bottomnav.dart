// ignore_for_file: library_private_types_in_public_api

import 'package:doggo_project/home.dart';
import 'package:flutter/material.dart';
//import 'package:project1/search.dart';
//import 'home.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final int _currentIndex = 0;
  void onTabTapped(int index) {
    // if (index == 0) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => MyHomePage()),
    //   );
    // }
    // else if (index == 1) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const SearchBar()),
    //   );
    // }
    // else {
    //   setState(() {
    //     _currentIndex = index;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      iconSize: 30,
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          label: "Categories",
          icon: Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          label: "My Account",
          icon: Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }
}
