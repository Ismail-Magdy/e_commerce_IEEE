import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Sign up
  Future<bool> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  /// Login
  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user != null;
    } catch (e) {
      rethrow;
    }
  }
}
