import 'dart:convert'; // Import the dart:convert library

import 'package:http/http.dart' as http;
import 'package:spot_doctor/data/chat/chat_repository.dart';
import 'package:spot_doctor/utils/constants.dart';

class GptChatRepository implements ChatRepository {
  @override
  Future<String?> getChatResponse(String content) async {
    final url = Uri.parse(GptData.url);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${GptData.apiKey}',
    };
    final body = jsonEncode({
      // Convert the body Map to a JSON string
      "model": GptData.gptModelName,
      "messages": [
        {"role": "user", "content": "$content. Reply me within 160 tokens"}
      ],
      "temperature": GptData.temperature,
      "max_tokens": GptData.maxTokens,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      return null;
    }
  }
}
