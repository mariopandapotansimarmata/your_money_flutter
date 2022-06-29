// ignore_for_file: prefer_final_fields, avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // static Future signInAnonymous() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User firebaseUser = result.user;
  //     return firebaseUser;
  //   } catch (e) {
  //     print(e.toString());

  //     return null;
  //   }
  // }

  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }
}
