import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Speech {
  stt.SpeechToText _speechToText = stt.SpeechToText();
  bool speechEnabled = false; final callback;
  // init tts
  Speech({required this.callback});
  Future <bool> initSpeech () async {
     speechEnabled = await _speechToText.initialize(); 
     return speechEnabled;
  }
    
  /// Each time to start a speech recognition session
  void startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void stopListening() async {
    await _speechToText.stop();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    callback(result.recognizedWords);
  }
}