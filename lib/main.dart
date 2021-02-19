import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/user.dart';
import 'package:menstruating/pages/welcome.dart';
import 'package:menstruating/pages/new_user.dart';
import 'package:menstruating/pages/homepage.dart';
import 'package:menstruating/pages/restoredata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/Welcome',
      routes: {
        '/welcome': (context) => Welcome(),
        '/newUser': (context) => NewUser(),
        '/homepage': (context) => HomeScreen(),
        '/restoredata': (context) => RestoreData(),
        '/user': (context) => User(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: KTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(),
    );
  }
}
