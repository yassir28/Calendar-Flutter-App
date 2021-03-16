import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menstruating/models/queen.dart';
import 'package:menstruating/models/user.dart';
import 'package:menstruating/pages/home_page_components/homescreen.dart';
import 'package:menstruating/pages/home_page_components/profile.dart';
import 'package:menstruating/pages/home_page_components/reports.dart';
import 'package:menstruating/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageNumber = 1;
  PageController pageController = PageController(initialPage: 1);
  final List screens = <Widget>[
    Reports(),
    HomeScreen(),
    Profile(),
  ];

  onPageChanged(int index) {
    setState(() {
      pageNumber = index;
    });
  }

  onItemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screens,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageNumber,
        selectedLabelStyle: TextStyle(
            color: Colors.pink[300], fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 11, color: Colors.grey),
        selectedIconTheme: IconThemeData(color: Colors.pink[300], size: 32),
        unselectedIconTheme:
            IconThemeData(size: 26, color: Colors.grey.shade300),
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart_rounded,
            ),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.text_snippet,
              ),
              label: "Profile")
        ],
      ),
    );
  }
}
