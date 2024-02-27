import 'package:dartz/dartz.dart';

abstract class ChatUseCase {
  Future<Either<String, String>> getChatResponse(String content);
}
