import 'dart:developer';

import 'package:chat_gpt/constants/api_key.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AiHandler {
  final _openAI = OpenAI.instance.build(
    token: apiKey,
    baseOption: HttpSetup(receiveTimeout: 20000),
  );

  Future<String> ask(String message) async {
    try {
      final request = CompleteText(prompt: message, model: kTranslateModelV3);
      final response = await _openAI.onCompleteText(request: request);

      if (response != null) {
        return response.choices.first.text.trim();
      }
      return 'Something went wrong';
    } catch (error) {
      log('-------------------- ask ERROR --------------------\n${error.toString()}');
      return 'Bad response';
    }
  }

  void dispose() {
    _openAI.close();
  }
}
