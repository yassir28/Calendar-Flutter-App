import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/questions.dart';
import 'package:menstruating/pages/restoredata.dart';
import 'package:menstruating/services/auth.dart';
import 'package:menstruating/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:menstruating/models/user.dart' as models;

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Color(0xfff4e6f0),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/pale_pink.jpg",
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(KDefaultPaddin),
                  child: Container(
                    width: width,
                    height: height * 0.2,
                    child: Center(
                      child: Text(
                        "Hi! Welcome to  \n Period Calendar!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.pink[300], letterSpacing: 1.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: KDefaultPaddin, vertical: KDefaultPaddin / 2),
                  width: width * 0.8,
                  height: height * 0.075,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.pink[400];
                          return Colors.pink[300];
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.pink[300]),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      dynamic result = await _auth.singInAnon();
                      if (result == null) {
                        print('there is an error');
                      } else {
                        print(result.uid);
                      }

                      // we initiate it with current data
                      await DataBaseService(uid: result.uid).initiatePeriodData(
                          periodDate: DateTime.now(),
                          periodCycle: 28,
                          periodLength: 5);

                      //must be replaced cos we dont want to re-initiate bd
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Questions()),
                      );
                    },
                    child:
                        Text("New User", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: KDefaultPaddin, vertical: KDefaultPaddin / 2),
                  width: width * 0.8,
                  height: height * 0.075,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.pink[100];
                          return Color(0xfff4e6f0);
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.pink[300]),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RestoreData()),
                      );
                    },
                    child: Text(
                      "Restore Data",
                      style: TextStyle(color: Colors.pink[300]),
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.grey[800], height: 1.5, wordSpacing: 2.5),
                    children: [
                      TextSpan(text: 'If you continue, you agree to the\n'),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: '\t and the\t'),
                      TextSpan(
                        text: 'Terms of service',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
