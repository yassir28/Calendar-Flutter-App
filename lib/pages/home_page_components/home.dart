import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/components/calendrier.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.5,
              child: Calendar(),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KDefaultPaddin),
              child: Row(
                children: [
                  Container(
                    width: width * 0.075,
                    child: Icon(
                      Icons.circle,
                      color: Colors.pink[300],
                      size: 10,
                    ),
                  ),
                  Container(
                    width: width * 0.15,
                    child: Text("Period"),
                  ),
                  Container(
                      width: width * 0.075,
                      child: Icon(Icons.radio_button_off, size: 10)),
                  Container(
                    width: width * 0.15,
                    child: Text("Prediction"),
                  ),
                  Container(
                    height: 10,
                    width: width * 0.075,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: width * 0.15,
                    child: Text("Fertile"),
                  ),
                  Container(
                    width: width * 0.075,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.teal[800],
                      size: 15,
                    ),
                  ),
                  Container(
                    width: width * 0.15,
                    child: Text("Ovulation"),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(KDefaultPaddin),
              child: Row(
                children: [
                  Text("we need to update the period interactivally"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
