import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/models/user.dart';
import 'package:menstruating/pages/components/calendrier.dart';
import 'package:menstruating/services/database.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  Future<int> getLength(User user) async {
    DocumentSnapshot result = await DataBaseService(uid: user.uid).getData();
    return result.data()['period length'];
  }

  Future<int> getCycle(User user) async {
    DocumentSnapshot result = await DataBaseService(uid: user.uid).getData();
    return result.data()['period cycle'];
  }

  Future<DateTime> getDate(User user) async {
    DocumentSnapshot result = await DataBaseService(uid: user.uid).getData();
    return result.data()['period date'];
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    getLength(user);

    getCycle(user);

    getDate(user);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        centerTitle: true,
        title: Text(
          "HOME",
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      body: Column(
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
                  width: width * 0.05,
                  child: Icon(
                    Icons.circle,
                    color: Colors.pink[300],
                    size: 10,
                  ),
                ),
                Container(
                  width: width * 0.13,
                  child: Text("Period"),
                ),
                Container(
                    width: width * 0.05,
                    child: Icon(Icons.radio_button_off, size: 10)),
                Container(
                  width: width * 0.2,
                  child: Text("Prediction"),
                ),
                Container(
                  height: 10,
                  width: width * 0.05,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: width * 0.13,
                  child: Text("Fertile"),
                ),
                Container(
                  width: width * 0.05,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.teal[800],
                    size: 15,
                  ),
                ),
                Container(
                  width: width * 0.2,
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
    );
  }
}
