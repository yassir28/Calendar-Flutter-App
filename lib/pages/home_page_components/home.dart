import 'package:flutter/material.dart';
import 'package:menstruating/pages/components/calendrier.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Calendar(),
          Divider(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              Text("Period"),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.radio_button_off, size: 10),
              Text("Prediction"),
              Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              Text("Fertile"),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite,
                color: Colors.teal[800],
              ),
              Text("Ovulation"),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
