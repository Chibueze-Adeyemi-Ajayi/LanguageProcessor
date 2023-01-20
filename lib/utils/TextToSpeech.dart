import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  
  final callback;
  TextToSpeech({required this.callback});

  // text to speech module
  FlutterTts flutterTts = FlutterTts();

  // speaking via speaker
  Future speak(String text) async{
    var result = await flutterTts.speak(text);
    if (result == 1) callback(true); else callback(false);
  }

  // stopping the speech event
  Future stop() async{ 
      var result = await flutterTts.stop();
      if (result == 1) callback(true); else callback(false);
  }

}