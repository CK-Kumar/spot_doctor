class AppRoutes {
  static const home = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const chat = '/chat';
}

class GptData {
  static const apiKey = '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';
  static const gptModelName = 'gpt-3.5-turbo-16k-0613';
  static const maxTokens = 180;
  static const temperature = 0.65;
  static const url = 'https://api.openai.com/v1/chat/completions';
}
