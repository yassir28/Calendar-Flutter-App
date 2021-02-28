import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/services/auth.dart';

class Welcome extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4e6f0),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/images/pale_pink.jpg",
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
                buildFlatButton(
                  color: Colors.pink[300],
                  width: width * 0.8,
                  height: height * 0.075,
                  text: Text("New User", style: TextStyle(color: Colors.white)),
                  press: () async {
                    dynamic result = await _auth.singInAnon();
                    Navigator.of(context).pushNamed('/user');
                    if (result == null) {
                      print('error signing in');
                    } else {
                      print('signed in');
                      print(result.uid);
                    }
                  },
                ),
                buildFlatButton(
                  color: Colors.transparent,
                  width: width * 0.8,
                  height: height * 0.075,
                  text: Text(
                    "Restore Data",
                    style: TextStyle(color: Colors.pink[300]),
                  ),
                  press: () {
                    Navigator.of(context).pushNamed('/resotredata');
                  },
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

  Container buildFlatButton(
      {double width, Function press, Text text, Color color, double height}) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: KDefaultPaddin, vertical: KDefaultPaddin / 2),
      width: width,
      height: height,
      child: FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: BorderSide(color: color)),
        onPressed: press,
        child: text,
      ),
    );
  }
}
