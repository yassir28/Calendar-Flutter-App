import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                tileColor: WTextColor,
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20,
                  child: ClipOval(
                    child: Image.asset('assets/images/girl.png'),
                  ),
                ),
                title: Text("Profile"),
                subtitle: Text("Back up your data"),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_right, size: 30),
                  onPressed: () {},
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: WTextColor,
                onTap: () {},
                title: Text("Period Lenght"),
                leading: Icon(Icons.date_range),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: WTextColor,
                onTap: () {},
                title: Text("Cycle Lenght"),
                leading: Icon(Icons.wifi_protected_setup),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: WTextColor,
                onTap: () {},
                title: Text("Reminders"),
                leading: Icon(Icons.notifications_active, color: Colors.grey),
              ),
            ),
            Divider(
              thickness: 5,
            ),
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
        ),
      ),
    );
  }
}
