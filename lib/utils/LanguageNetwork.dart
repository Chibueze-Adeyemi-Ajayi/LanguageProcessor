import 'package:flutter/material.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

// Language Neural Network
class LanguageNetwork {

  // language detection
  static final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);

  static Future <String> detectLanguage (text, context) async {
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    });
    final response = await languageIdentifier.identifyLanguage(text);
    final List<IdentifiedLanguage> possibleLanguages = await languageIdentifier.identifyPossibleLanguages(text);
    Navigator.pop(context);
    return response;
  }

  // language translation
  static final TranslateLanguage _sourceLanguage = TranslateLanguage.english;
  static final TranslateLanguage _targetLanguage = TranslateLanguage.spanish;
  static final _onDeviceTranslator = OnDeviceTranslator(sourceLanguage: _sourceLanguage, targetLanguage: _targetLanguage);
      
  static Future <String> translate (text, context) async { String response = "";
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    });
    try {

      response += await _onDeviceTranslator.translateText(text);
      print(response);
      return response;

    } catch (e) {} finally {Navigator.pop(context);} return response;
  }
   
}