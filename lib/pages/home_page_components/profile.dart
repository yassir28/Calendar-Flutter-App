import 'package:flutter/material.dart';
import 'package:menstruating/services/auth.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();
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
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  /*child: ClipOval(
                    child: Image.asset('assets/images/girl.png'),
                  ),*/
                ),
                title: Text("Profile"),
                subtitle: Text("Back up your data"),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: Colors.pink[100],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("Period Lenght"),
                leading: Icon(
                  Icons.date_range,
                  color: Colors.pink[100],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("Cycle Lenght"),
                leading: Icon(
                  Icons.wifi_protected_setup,
                  color: Colors.pink[100],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("Reminders"),
                leading: Icon(
                  Icons.notifications_active,
                  color: Colors.pink[100],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("Settings icon"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.pink[100],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("Rate Us"),
                leading: Icon(
                  Icons.star,
                  color: Colors.pink[100],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("Send email feedback"),
                leading: Icon(
                  Icons.email,
                  color: Colors.pink[100],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () async {
                  //           await _auth.signOut();
                },
                title: Text("delete all records"),
                leading: Icon(
                  Icons.delete_rounded,
                  color: Colors.pink[100],
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text("About"),
                leading: Icon(
                  Icons.date_range_rounded,
                  color: Colors.pink[100],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
