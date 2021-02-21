import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          elevation: 0,
          title: Text("Reports"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Period",
                icon: Icon(Icons.circle),
              ),
              Tab(
                text: "Sex",
                icon: Icon(Icons.home_outlined),
              ),
              Tab(
                text: "Prediction",
                icon: Icon(Icons.online_prediction_outlined),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.crop_16_9), Text("x")],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.crop_16_9), Text("x")],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.crop_16_9), Text("x")],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
