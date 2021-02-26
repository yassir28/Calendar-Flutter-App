import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/user.dart';
import 'package:menstruating/pages/welcome.dart';
import 'package:menstruating/pages/homepage.dart';
import 'package:menstruating/pages/restoredata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menstruating/pages/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/Welcome',
      routes: {
        '/welcome': (context) => Welcome(),
        '/homepage': (context) => HomeScreen(),
        '/restoredata': (context) => RestoreData(),
        '/user': (context) => User(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: KTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('you have an error!${snapshot.error.toString()}');
            return Text("Something Went Wrong");
          } else if (snapshot.hasData) {
            return Wrapper();
          } else {
            Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
