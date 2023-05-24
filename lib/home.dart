import 'package:flutter/material.dart';
import 'appbar.dart';
import 'bottomnav.dart';

class MyContainerData {
  final Color color;
  final String text;

  MyContainerData({required this.color, required this.text});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MyContainerData> containerDataList = [
    MyContainerData(color: Colors.blue, text: 'Image 1'),
    MyContainerData(color: Colors.green, text: 'Image 2'),
    MyContainerData(color: Colors.grey, text: 'Image 3'),
    MyContainerData(color: Colors.amber, text: 'Image 4'),
    MyContainerData(color: Colors.pink, text: 'Image 5'),
    MyContainerData(color: Colors.yellowAccent, text: 'Image 6'),
    MyContainerData(color: Colors.blue, text: 'Image 7'),
    MyContainerData(color: Colors.indigo, text: 'Image 8'),
    MyContainerData(color: Colors.teal, text: 'Image 9'),
    MyContainerData(color: Colors.pinkAccent, text: 'Image 10'),
    MyContainerData(color: Colors.lightBlue, text: 'Image 11'),
    MyContainerData(color: Colors.lime, text: 'Image 12'),
    MyContainerData(color: Colors.blueGrey, text: 'Image 13'),
    MyContainerData(color: Colors.deepOrange, text: 'Image 14'),
    MyContainerData(color: Colors.cyan, text: 'Image 15'),
    MyContainerData(color: Colors.cyanAccent, text: 'Image 16'),
    MyContainerData(color: Colors.green, text: 'Image 17'),
    MyContainerData(color: Colors.greenAccent, text: 'Image 18'),
    MyContainerData(color: Colors.grey, text: 'Image 19'),
    MyContainerData(color: Colors.blue, text: 'Image 20'),
    MyContainerData(color: Colors.orange, text: 'Image 21'),
    MyContainerData(color: Colors.red, text: 'Image 22'),
    MyContainerData(color: Colors.purple, text: 'Image 23'),
    MyContainerData(color: Colors.pink, text: 'Image 24'),
  ];
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      //Reached the end of the list
      //Perfrm loading operations here
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        Future.delayed(const Duration(seconds: 2), () async {
          setState(() {
            isLoading = false;
            //Add new items to the list
            final newImages = [
              MyContainerData(color: Colors.blue, text: 'Image 1'),
              MyContainerData(color: Colors.green, text: 'Image 2'),
              MyContainerData(color: Colors.grey, text: 'Image 3'),
              MyContainerData(color: Colors.amber, text: 'Image 4'),
              MyContainerData(color: Colors.pink, text: 'Image 5'),
              MyContainerData(color: Colors.yellowAccent, text: 'Image 6'),
              MyContainerData(color: Colors.blue, text: 'Image 7'),
              MyContainerData(color: Colors.indigo, text: 'Image 8'),
              MyContainerData(color: Colors.teal, text: 'Image 9'),
              MyContainerData(color: Colors.pinkAccent, text: 'Image 10'),
              MyContainerData(color: Colors.lightBlue, text: 'Image 11'),
              MyContainerData(color: Colors.lime, text: 'Image 12'),
              MyContainerData(color: Colors.blueGrey, text: 'Image 13'),
              MyContainerData(color: Colors.deepOrange, text: 'Image 14'),
              MyContainerData(color: Colors.cyan, text: 'Image 15'),
              MyContainerData(color: Colors.cyanAccent, text: 'Image 16'),
              MyContainerData(color: Colors.green, text: 'Image 17'),
              MyContainerData(color: Colors.greenAccent, text: 'Image 18'),
              MyContainerData(color: Colors.grey, text: 'Image 19'),
              MyContainerData(color: Colors.blue, text: 'Image 20'),
              MyContainerData(color: Colors.orange, text: 'Image 21'),
              MyContainerData(color: Colors.red, text: 'Image 22'),
              MyContainerData(color: Colors.purple, text: 'Image 23'),
              MyContainerData(color: Colors.pink, text: 'Image 24'),
            ];

            for (var image in newImages) {
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  containerDataList.add(image);
                });
              });
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          controller: _scrollController,
          itemCount: containerDataList.length + 1, //Add 1 for loader
          itemBuilder: (BuildContext context, int index) {
            if (index < containerDataList.length) {
              final containerData = containerDataList[index];
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: containerData.color,
                    child: Center(
                      child: Text(
                        containerData.text,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              //Show loader
              if (isLoading) {
                return const Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }
          }),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
