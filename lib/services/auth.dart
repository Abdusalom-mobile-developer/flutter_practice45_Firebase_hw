import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_practice45_firebase_hw/services/log.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static bool isLoggedin() {
    User? userInfo = _auth.currentUser;
    if (userInfo != null) {
      return true;
    }
    return false;
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      LogService.e(e.toString());
      return false;
    }
  }

  static Future<bool> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final User? check = _auth.currentUser;
      return check != null;
    } catch (e) {
      LogService.w(e.toString());
      return false;
    }
  }

  static Future<void> logOut() async {
    await _auth.signOut();
  }
}
