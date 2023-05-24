// ignore_for_file: file_names

import 'package:flutter/material.dart';

final appBar = AppBar(
  title: const Text('Doggoo'),
  actions: const <Widget>[
    SearchButton(),
  ],
  backgroundColor: Colors.black,
);

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _isExpanded ? 380.0 : 50.0,
        child: Row(
          children: <Widget>[
            const Icon(Icons.search),
            _isExpanded
                ? const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        hintText: 'Search',
                        border: InputBorder.none,
                        fillColor: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    color: Colors.black,
                  ),
          ],
        ),
      ),
    );
  }
}
