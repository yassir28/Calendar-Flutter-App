import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menstruating/models/user.dart';
import 'package:menstruating/pages/home.dart';
import 'package:menstruating/pages/questions_components/question1.dart';
import 'package:menstruating/pages/questions_components/question2.dart';
import 'package:menstruating/pages/questions_components/question3.dart';
import 'package:menstruating/services/database.dart';
import 'package:provider/provider.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
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
          Question1(
              pageIndex: _pageIndex,
              onPageChanged: _onPageChanged,
              pageController: _pageController),
          Question2(
              pageIndex: _pageIndex,
              onPageChanged: _onPageChanged,
              pageController: _pageController),
          Question3(),
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
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
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
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: width * 0.22,
                height: 1,
                color: Colors.pink[300],
              ),
              Container(
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: width * 0.22,
                height: 1,
                color: Colors.pink[300],
              ),
              Container(
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
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
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: width * 0.22,
                height: 1,
                color: Colors.pink[300],
              ),
              Container(
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: width * 0.22,
                height: 1,
                color: Colors.pink[300],
              ),
              Container(
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
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
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: width * 0.22,
                height: 1,
                color: Colors.pink[300],
              ),
              Container(
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: width * 0.22,
                height: 1,
                color: Colors.pink[300],
              ),
              Container(
                height: width * 0.075,
                width: width * 0.075,
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.pink[300],
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        );
      // case 1:
      //   return Container(
      //     child: Row(
      //       children: [
      //         Container(
      //           height: 10,
      //           width: width * 0.2,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.rectangle,
      //             border: Border.all(
      //               color: Colors.pink[300],
      //               width: 1,
      //             ),
      //           ),
      //           child: DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: Colors.pink[300],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: 10,
      //           width: width * 0.2,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.rectangle,
      //             border: Border(
      //               top: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               right: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               bottom: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               left: BorderSide(
      //                 color: Colors.transparent,
      //                 width: 1,
      //               ),
      //             ),
      //           ),
      //           child: DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: Colors.pink[300],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: 10,
      //           width: width * 0.2,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.rectangle,
      //             border: Border.all(
      //               color: Colors.pink[300],
      //               width: 1,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   );
      // case 2:
      //   return Container(
      //     child: Row(
      //       children: [
      //         Container(
      //           height: 10,
      //           width: width * 0.2,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.rectangle,
      //             border: Border.all(
      //               color: Colors.pink[300],
      //               width: 1,
      //             ),
      //           ),
      //           child: DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: Colors.pink[300],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: 10,
      //           width: width * 0.2,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.rectangle,
      //             border: Border(
      //               top: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               right: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               bottom: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               left: BorderSide(
      //                 color: Colors.transparent,
      //                 width: 1,
      //               ),
      //             ),
      //           ),
      //           child: DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: Colors.pink[300],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: 10,
      //           width: width * 0.2,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.rectangle,
      //             border: Border(
      //               top: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               right: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               bottom: BorderSide(
      //                 color: Colors.pink[300],
      //                 width: 1,
      //               ),
      //               left: BorderSide(
      //                 color: Colors.transparent,
      //                 width: 1,
      //               ),
      //             ),
      //           ),
      //           child: DecoratedBox(
      //             decoration: BoxDecoration(
      //               color: Colors.pink[300],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   );
    }
  }
}
