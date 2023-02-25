import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';

class VoiceHandler {
  final SpeechToText _speechToText = SpeechToText();
  SpeechToText get service => _speechToText;

  bool _isSpeechEnabled = false;
  bool get isSpeechEnabled => _isSpeechEnabled;

  void init() async {
    _isSpeechEnabled = await _speechToText.initialize();
  }

  Future<String> startListening() async {
    final completer = Completer<String>();
    _speechToText.listen(
      onResult: (result) {
        if (result.finalResult) {
          completer.complete(result.recognizedWords);
        }
      },
    );

    return completer.future;
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
  }
}
