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
  PageController pageController = PageController(initialPage: 1);
  final List screens = <Widget>[
    Reports(),
    Home(),
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
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .merge(TextStyle(fontSize: 12)),
        unselectedLabelStyle:
            Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 11)),
        onTap: onItemTapped,
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
