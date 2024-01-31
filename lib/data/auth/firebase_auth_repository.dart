import 'package:firebase_auth/firebase_auth.dart';
import 'package:spot_doctor/data/auth/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      // Handle authentication errors
      return null;
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      // Handle registration errors
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<User?> checkAuthState() async {
    try {
      final User? user = _firebaseAuth.currentUser;
      return user;
    } catch (e) {
      // Handle errors if any
      return null;
    }
  }
}
