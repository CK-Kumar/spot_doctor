import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:spot_doctor/data/chat/chat_repository.dart';
import 'package:spot_doctor/domain/chat/chat_usecase.dart';
import 'package:spot_doctor/services/service_locator.dart';

class ChatUseCaseImpl extends ChatUseCase {
  final ChatRepository _chatRepository = locator<ChatRepository>();

  @override
  Future<Either<String, String>> getChatResponse(String content) async {
    try {
      final response = await _chatRepository.getChatResponse(content);
      if (response != null) {
        var jsonResponse = jsonDecode(response);
        return Right(
            jsonResponse['choices'][0]['message']['content'].toString().trim());
      } else {
        return const Left('Failed to get chat response');
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}
