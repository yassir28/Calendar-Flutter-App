import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/components/boxdialog.dart';
import 'package:menstruating/pages/components/colordot.dart';
import 'package:menstruating/pages/components/numbersList.dart';

class NewUser2 extends StatefulWidget {
  final int pageIndex;
  final ValueChanged<int> onPageChanged;
  final PageController pageController;

  const NewUser2(
      {Key key, this.pageIndex, this.onPageChanged, this.pageController})
      : super(key: key);
  @override
  _NewUser2State createState() => _NewUser2State();
}

class _NewUser2State extends State<NewUser2> {
  int selectedIndex = 0;

  void _refresh(bool _isSelected) {
    setState(() => selectedIndex = _isSelected ? 1 : 0);
  }

  buildBodyScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 18),
                    child: Text(
                      "On average, how long is your period cycle?",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Container(
                    child: BoxwDialog(
                      listBody: ListBody(
                        children: [
                          Text(
                              "Cycle lenght means the duration of two dates of period start, usually 21-36 days."),
                          Divider(),
                          Text(
                            "The cycle lenght you selected will be used to predict your next cycle lenght.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NumbersList(
              numbermax: 100,
              numbermin: 15,
            ),
          ],
        );
        break;
      case 1:
        return Container(
          margin: EdgeInsets.all(KDefaultPaddin),
          child: Center(
            child: Text(
              "Answered.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.pink[400],
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          buildBodyScreen(selectedIndex),
          Padding(
            padding: const EdgeInsets.all(KDefaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorDot(
                  refresh: _refresh,
                ),
                Text("I don't know")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(KDefaultPaddin),
            height: height * 0.075,
            width: width * 0.8,
            child: RaisedButton(
              color: Colors.pink[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
                side: BorderSide(color: Colors.pink[400]),
              ),
              onPressed: () {
                widget.pageController.jumpToPage(widget.pageIndex + 1);
                widget.onPageChanged(widget.pageIndex + 1);
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: WTextColor,
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
}
