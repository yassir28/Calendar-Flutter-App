import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:menstruating/models/user.dart' as models;
import 'package:menstruating/services/database.dart';

class AuthService {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance; //afain

  // create a user obj based on FirebaseUser
  models.User _userFromFirebaseUser(firebase.User user) {
    return user != null ? models.User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<models.User> get user {
    return _auth
        .authStateChanges()
        .map((firebase.User user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future singInAnon() async {
    try {
      firebase.UserCredential credential = await _auth.signInAnonymously();
      firebase.User user = credential.user;

      //  create a new document for the user with the uid =>"dummy data"
      await DataBaseService(uid: user.uid)
          .updateUserData(periodLength: 3, periodCycle: 28, periodDate: null);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print('The error is: ${e.toString()}');
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('your error is ${e.toString()}');
      return null;
    }
  }
}
