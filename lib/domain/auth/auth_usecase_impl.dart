import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spot_doctor/data/auth/auth_repository.dart';
import 'package:spot_doctor/domain/auth/auth_usecase.dart';
import 'package:spot_doctor/services/service_locator.dart';

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository _authRepository = locator<AuthRepository>();

  @override
  Future<Either<String, User?>> signInWithEmailAndPassword(
      String email, String password) async {
    final user =
        await _authRepository.signInWithEmailAndPassword(email, password);
    if (user != null) {
      return Right(user);
    } else {
      return Left('user.login_error'.tr());
    }
  }

  @override
  Future<Either<String, User?>> signUpWithEmailAndPassword(
      String email, String password) async {
    final user =
        await _authRepository.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      return Right(user);
    } else {
      return Left('user.register_error'.tr());
    }
  }

  @override
  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
