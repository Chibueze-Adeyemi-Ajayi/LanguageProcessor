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
  static final modelManager = OnDeviceTranslatorModelManager();

  static Future <String> translate (text, context) async { String response = "";
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    });
    try {

      // downloading language models
      
      if (!await modelManager.isModelDownloaded(TranslateLanguage.english.bcpCode))
      final bool response_ = await modelManager.isModelDownloaded(TranslateLanguage.english.bcpCode);
      if (!await modelManager.isModelDownloaded(TranslateLanguage.spanish.bcpCode))
      final bool response__ = await modelManager.isModelDownloaded(TranslateLanguage.spanish.bcpCode);

      response += await _onDeviceTranslator.translateText(text); Navigator.pop(context);
      return response; 

    } catch (e) {Navigator.pop(context); print("error");} finally {
      _onDeviceTranslator.close();
    } return response;
  }
   
}