import 'package:get_it/get_it.dart';
import 'package:spot_doctor/data/auth/auth_repository.dart';
import 'package:spot_doctor/data/auth/firebase_auth_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
}
