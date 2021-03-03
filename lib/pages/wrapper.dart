import 'package:flutter/material.dart';
import 'package:menstruating/models/user.dart';
import 'package:menstruating/pages/home.dart';
import 'package:menstruating/pages/welcome.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Welcome();
    } else {
      return Home();
    }
  }
}
