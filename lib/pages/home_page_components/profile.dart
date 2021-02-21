import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[300],
          title: Text(
            "PROFILE",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        body: Container(
          child: ListTile(
            onTap: () {},
            title: Text("Profile"),
            leading: CircleAvatar(
              maxRadius: 10,
              backgroundImage: AssetImage('assets/images/girl.png'),
            ),
          ),
        )
        /*Column(
        children: [
          ListView(
            children: [
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Profile"),
                  leading: CircleAvatar(
                    maxRadius: 10,
                    backgroundImage: AssetImage('assets/girl.png'),
                  ),
                ),
              ),
              /* Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Period Lenght"),
                  leading: Text("blood icon"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Cycle Lenght"),
                  leading: Text("cycle icon"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Reminders"),
                  leading: Text("jaras icon"),
                ),
              ),*/
            ],
          ),
          /*ListView(
            children: [
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Settings"),
                  leading: Text("Settings icon"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Rate Us"),
                  leading: Text("star icon"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("Send email feedback"),
                  leading: Text("email icon"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("delete all records"),
                  leading: Text("delete icon"),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () {},
                  title: Text("About"),
                  leading: Text("about(danger) icon"),
                ),
              )
            ],
          ),*/
        ],
      ),*/
        );
  }
}
