import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/components/boxdialog.dart';
import 'package:menstruating/pages/components/calendrier.dart';
import 'package:menstruating/pages/components/colordot.dart';
import 'package:menstruating/pages/home.dart';
import 'package:menstruating/services/auth.dart';

class Question3 extends StatefulWidget {
  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  final AuthService _auth = AuthService();

  void _refresh(bool _isSelected) {
    setState(() => selectedIndex = _isSelected ? 1 : 0);
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
          buildBodyScreen(selectedIndex: selectedIndex, height: height),
          Padding(
            padding: const EdgeInsets.all(KDefaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ColorDot(refresh: _refresh), Text("I don't know")],
            ),
          ),
          Container(
            height: height * 0.075,
            width: width * 0.8,
            child: RaisedButton(
              color: Colors.pink[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                  side: BorderSide(color: Colors.pink[300])),
              onPressed: () async {
                dynamic result = await _auth.singInAnon();
                if (result == null) {
                  print('there is an error');
                } else {
                  print(result.uid);
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
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

  buildBodyScreen({int selectedIndex, double height}) {
    switch (selectedIndex) {
      case 0:
        return Column(
          children: [
            Container(
              height: height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 18),
                    child: Text(
                      "When did your last period start?",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Container(
                    child: BoxwDialog(
                      listBody: ListBody(
                        children: [
                          Text(
                            "Scroll to change the month, and tap to select the start date of your last period.",
                            textAlign: TextAlign.justify,
                          ),
                          Divider(),
                          Text(
                            "The date you selected will be used to predict your next period lenght.",
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
              height: height * 0.55,
              child: Calendar(),
            ),
          ],
        );
        break;
      case 1:
        return Container(
          height: height * 0.65,
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}