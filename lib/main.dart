import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';
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
        theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: KTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
