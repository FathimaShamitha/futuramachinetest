import 'package:flutter/material.dart';
import 'package:foodapp/view/userprofilescreen.dart';

import 'homescreen.dart';
import 'menuscreen.dart';

class MainScreenClass extends StatefulWidget {
  const MainScreenClass({Key? key}) : super(key: key);

  @override
  State<MainScreenClass> createState() => _MainScreenClassState();
}

class _MainScreenClassState extends State<MainScreenClass> {
  int cIndex = 0;
  late PageController pageController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: cIndex);
  }

  void change(index) {
    setState(() {
      cIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "User"),
        ],
        currentIndex: cIndex,
        onTap: change,
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreenClass(),
          MenuScreenClass(),
          UserProfileClass()
        ],
      ),
    );
  }
}
