import 'package:get_it/get_it.dart';
import 'package:spot_doctor/data/auth/auth_repository.dart';
import 'package:spot_doctor/data/auth/firebase_auth_repository.dart';
import 'package:spot_doctor/data/chat/chat_repository.dart';
import 'package:spot_doctor/data/chat/gpt_chat_repository.dart';
import 'package:spot_doctor/domain/auth/auth_usecase.dart';
import 'package:spot_doctor/domain/auth/auth_usecase_impl.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
  locator.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl());
  locator.registerLazySingleton<ChatRepository>(() => GptChatRepository());
}
