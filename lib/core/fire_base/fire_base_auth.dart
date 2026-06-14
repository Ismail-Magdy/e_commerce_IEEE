import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuth {
  Future<bool> signUp(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> login(String name, String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(password: password, email: email);
    if (userCredential.user == null) {
      return false;
    } else {
      return true;
    }
  }
}
