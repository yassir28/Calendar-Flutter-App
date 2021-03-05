import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/models/user.dart';
import 'package:menstruating/pages/components/boxdialog.dart';
import 'package:menstruating/pages/components/colordot.dart';
import 'package:menstruating/pages/components/numbersList.dart';
import 'package:menstruating/services/database.dart';
import 'package:provider/provider.dart';

class Question1 extends StatefulWidget {
  final int pageIndex;
  final ValueChanged<int> onPageChanged;
  final PageController pageController;

  const Question1(
      {Key key, this.pageIndex, this.onPageChanged, this.pageController})
      : super(key: key);

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  int periodLenght = 0;
  int _numbermin = 2;

  void _refresh(bool _isSelected, User user) async {
    setState(() => selectedIndex = _isSelected ? 1 : 0);
    if (selectedIndex == 1) {
      await DataBaseService(uid: user.uid)
          .updatePeriodLength(periodLength: null);
    }
  }

  _onPeriodLengthChanged(int index, User user) async {
    await DataBaseService(uid: user.uid)
        .updatePeriodLength(periodLength: index + _numbermin);
  }

  buildPageScreen(int selectedIndex, double height) {
    switch (selectedIndex) {
      case 0:
        return Container(
          // height: height * 0.65,
          child: Column(
            children: [
              Container(
                height: height * 0.06,
                margin: EdgeInsets.all(KDefaultPaddin),
                child: Center(
                  child: Text(
                    "To predict period accurately,\n it would be better if you answer 3 questions.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.pink[300],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Text(
                        "On average, how long is your period?",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(
                      child: BoxwDialog(
                        listBody: ListBody(
                          children: [
                            Text(
                              "Period lenght means bleeding days, which usually lasts between 3 to 7 days.",
                              textAlign: TextAlign.justify,
                            ),
                            Divider(),
                            Text(
                              "The period lenght you selected will be used to predict your next period lenght.",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.45,
                child: NumbersList(
                  onChanged: _onPeriodLengthChanged,
                  numbermax: 14,
                  numbermin: _numbermin,
                ),
              ),
            ],
          ),
        );
        break;
      case 1:
        return Container(
          margin: EdgeInsets.all(KDefaultPaddin),
          height: height * 0.57,
          child: Center(
            child: Text(
              "Answered.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.pink[300],
                fontSize: 16,
              ),
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          buildPageScreen(selectedIndex, height),
          Padding(
            padding: const EdgeInsets.all(KDefaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorDot(refresh: _refresh),
                Text("I don't know"),
              ],
            ),
          ),
          Container(
            height: height * 0.075,
            width: width * 0.8,
            child: RaisedButton(
              color: Colors.pink[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: BorderSide(
                  color: Colors.pink[300],
                ),
              ),
              onPressed: () {
                widget.pageController.jumpToPage(widget.pageIndex + 1);
                widget.onPageChanged(widget.pageIndex + 1);
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
