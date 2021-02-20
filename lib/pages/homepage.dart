import 'package:flutter/material.dart';
import 'package:menstruating/pages/home_page_components/home.dart';
import 'package:menstruating/pages/home_page_components/profile.dart';
import 'package:menstruating/pages/home_page_components/reports.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNumber = 1;
  PageController pageController;
  final List screens = <Widget>[
    Reports(),
    Home(),
    Profile(),
  ];

  onPageChanged(index) {
    setState(() {
      pageNumber = index;
    });
  }

  onPageTapped(index) {
    pageController.jumpToPage(index);
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
        onTap: onPageTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart_rounded,
              color: pageNumber == 0 ? Colors.pink[300] : Colors.grey,
            ),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: pageNumber == 1 ? Colors.pink[300] : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.text_snippet,
                color: pageNumber == 2 ? Colors.pink[300] : Colors.grey,
              ),
              label: "Profile")
        ],
      ),
    );
  }
}
