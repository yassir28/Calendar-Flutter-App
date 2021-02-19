import 'package:flutter/material.dart';
import 'package:menstruating/pages/homepage.dart';
import 'package:menstruating/pages/new_user.dart';
import 'package:menstruating/pages/new_user2.dart';
import 'package:menstruating/pages/new_user3.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  PageController _pageController = PageController();

  int _pageIndex = 0;

  _onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          NewUser(
              pageIndex: _pageIndex,
              onPageChanged: _onPageChanged,
              pageController: _pageController),
          NewUser2(
              pageIndex: _pageIndex,
              onPageChanged: _onPageChanged,
              pageController: _pageController),
          NewUser3(),
        ],
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.pink[300],
          ),
          onPressed: () {
            if (_pageIndex == 0) {
              Navigator.pop(context);
            } else {
              _pageController.jumpToPage(--_pageIndex);
            }
          },
        ),
        title: buildAppBarTitle(width),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.pink[300],
            ),
            onPressed: () {
              if (_pageIndex == 2) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()),
                );
              } else {
                _pageController.jumpToPage(++_pageIndex);
              }
            },
          )
        ],
      ),
    );
  }

  Container buildAppBarTitle(width) {
    switch (_pageIndex) {
      case 0:
        return Container(
          child: Row(
            children: [
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 1,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                  ),
                ),
              ),
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 1,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 1,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          child: Row(
            children: [
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 1,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                  ),
                ),
              ),
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border(
                    top: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    left: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                  ),
                ),
              ),
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          child: Row(
            children: [
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 1,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                  ),
                ),
              ),
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border(
                    top: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    left: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                  ),
                ),
              ),
              Container(
                height: 10,
                width: width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border(
                    top: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                    left: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}

/*
newuser 3
appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: Colors.pink[300],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next_sharp, color: Colors.pink[300]),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()),
              );
            },
          ),
        ],
      ),


 newuser 2
appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: Colors.pink[300],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.navigate_next_sharp, color: Colors.pink[300]),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => NewUser3()),
                );
              })
        ],
  newuser 1
  appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/back.svg",
              color: Colors.pink[300],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            child: Row(
              children: [
                Container(
                  height: 10,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.pink[300],
                      width: 1,
                    ),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.navigate_next_sharp, color: Colors.pink[300]),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => NewUser2()),
                );
              },
            ),
          ],
        ),
  */
