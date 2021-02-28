import 'package:firebase_auth/firebase_auth.dart' as fb_user;
import 'package:menstruating/models/user.dart' as models_user;
import 'package:menstruating/services/database.dart';

class AuthService {
  final fb_user.FirebaseAuth _auth = fb_user.FirebaseAuth.instance;

  // create a user obj based on FirebaseUser
  models_user.User _userFromFirebaseUser(fb_user.User user) {
    return user != null ? models_user.User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<models_user.User> get user {
    return _auth
        .authStateChanges()
        .map((fb_user.User user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future singInAnon() async {
    try {
      fb_user.UserCredential credential = await _auth.signInAnonymously();
      fb_user.User user = credential.user;

      //  create a new document for the user with the uid
      await DataBaseService(uid: user.uid).updateUserData(3, 28, 15);

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
