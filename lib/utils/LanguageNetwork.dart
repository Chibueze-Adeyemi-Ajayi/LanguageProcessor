import 'package:flutter/material.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:language_processor/utils/Languages.dart';
import 'package:language_processor/utils/LocalStorage.dart';

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
  static final TranslateLanguage _targetLanguage = TranslateLanguage.hebrew;
  static final _onDeviceTranslator = OnDeviceTranslator(sourceLanguage: _sourceLanguage, targetLanguage: _targetLanguage);
  static final modelManager = OnDeviceTranslatorModelManager();

  // getting the user selected lnaguage choice
  static Future <String> getLocalLanguageBRPCode () async {
    List <String> languages = Languages.getSupportedLanguages(); int x = -1;
    String default_language = await LocalStorage(callback: (val) {}).getLocalLanguage();
    String brp_code = getLanguageModules(0);
    languages.forEach((lang) { x ++; print("lang");
      if (lang == default_language) brp_code = getLanguageModules(x);
    });
    return brp_code;
  }

  // getting the user selected lnaguage choice
  static Future <String> getTranslateLanguageBRPCode () async {
    List <String> languages = Languages.getSupportedLanguages(); int x = -1;
    String default_language = await LocalStorage(callback: (val) {}).getTranslateLanguage();
    String brp_code = getLanguageModules(7);
    languages.forEach((lang) { x ++;
      if (lang == default_language) brp_code = getLanguageModules(x);
    });
    return brp_code;
  }

  static String getLanguageModules (index) {
    return [
      TranslateLanguage.english.bcpCode, TranslateLanguage.spanish.bcpCode,
      TranslateLanguage.chinese.bcpCode, TranslateLanguage.japanese.bcpCode,
      TranslateLanguage.german.bcpCode, TranslateLanguage.greek.bcpCode,
      TranslateLanguage.french.bcpCode, TranslateLanguage.hebrew.bcpCode,
      TranslateLanguage.hindi.bcpCode, TranslateLanguage.italian.bcpCode,
      TranslateLanguage.korean.bcpCode, TranslateLanguage.portuguese.bcpCode,
      TranslateLanguage.romanian.bcpCode, TranslateLanguage.russian.bcpCode,
      TranslateLanguage.turkish.bcpCode,
    ][index];
  }
 
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
      if (!await modelManager.isModelDownloaded(TranslateLanguage.hebrew.bcpCode))
      final bool response__ = await modelManager.isModelDownloaded((TranslateLanguage.hebrew.bcpCode));

      response += await _onDeviceTranslator.translateText(text); Navigator.pop(context);
      return response; 

    } catch (e) {Navigator.pop(context); print("error $e");} finally {
      _onDeviceTranslator.close();
    } return response;
  }
   
}