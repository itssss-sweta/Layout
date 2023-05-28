import 'package:flutter/material.dart';
import 'bottomnav.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
                //contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: 20,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                )),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        child: const Center(
          child: Text(
            'No Search Found',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedIndex: 1),
    );
  }
}
