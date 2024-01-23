import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthUseCase {
  Future<Either<String, User?>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<String, User?>> signUpWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
}
