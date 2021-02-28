import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
import 'package:menstruating/pages/user.dart';
import 'package:menstruating/pages/welcome.dart';
import 'package:menstruating/pages/homepage.dart';
import 'package:menstruating/pages/restoredata.dart';
import 'package:menstruating/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menstruating/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:menstruating/models/user.dart' as models;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<models.User>.value(
      value: AuthService().user,
      child: MaterialApp(
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
        home: Wrapper(
            /*FutureBuilder(
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
        ),*/
            ),
      ),
    );
  }
}
