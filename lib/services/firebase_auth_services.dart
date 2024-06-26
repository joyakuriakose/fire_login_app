import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FirebaseAuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar('The email address is already in use.', 'Failed');
      } else {
        Get.snackbar('An error occurred: ${e.code}', 'Failed');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Get.snackbar('Invalid email or password.', 'Failed');
      } else {
        Get.snackbar('An error occurred: ${e.code}', 'Failed');
      }
    }
    return null;
  }
}