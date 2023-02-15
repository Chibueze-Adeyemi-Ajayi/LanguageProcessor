import 'package:flutter_tts/flutter_tts.dart';

// This snippet handles converti

class TextToSpeech {
  
  final callback;
  TextToSpeech({required this.callback});

  // text to speech module
  FlutterTts flutterTts = FlutterTts();

  // speaking via speaker
  Future <void> speak(String text) async{
    var result = await flutterTts.speak(text);
    if (result == 1) callback(true); else callback(false);
  }

  // stopping the speech event
  Future <void> stop() async{ 
      var result = await flutterTts.stop();
      if (result == 1) callback(true); else callback(false);
  }

  Future setLanguage (String lang) async {
    await flutterTts.setLanguage(lang);
  }

  Future setSpeechRate (double rate) async {
    await flutterTts.setSpeechRate(rate);
  }

  Future setVolume (double volume) async {
    await flutterTts.setVolume(volume);
  }

  Future setPitch (double pitch) async {
    await flutterTts.setPitch(pitch);
  }

}