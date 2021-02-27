import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon

  Future singInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User user = credential.user;
      return user;
    } catch (e) {
      print('The error is: ${e.toString()}');
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out

}
