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
  
  // getting the user selected lnaguage choice
  static Future <String> getLocalLanguageBRPCode () async {
    List <String> languages = Languages.getSupportedLanguages(); int x = -1;
    String default_language = await LocalStorage(callback: (val) {}).getLocalLanguage();
    String brp_code = getLanguageModules(0);
    //looping through languages
    languages.forEach((lang) { x ++; 
      if (lang == default_language) brp_code = getLanguageModules(x);
    }); 
    // return brp code
    return brp_code; 
  }

  // getting the user selected lnaguage choice
  static Future <String> getTranslateLanguageBRPCode () async {
    // getting built in translated langauges
    List <String> languages = Languages.getSupportedLanguages(); int x = -1;
    String default_language = await LocalStorage(callback: (val) {}).getTranslateLanguage();
    String brp_code = getLanguageModules(7);
    // looping through available languages
    languages.forEach((lang) { x ++;
      if (lang == default_language) brp_code = getLanguageModules(x);
    });
    return brp_code;
  }

  // getting the user selected language choice
  static Future <TranslateLanguage> getLocalLanguage () async {
    List <String> languages = Languages.getSupportedLanguages(); int x = -1;
    String default_language = await LocalStorage(callback: (val) {}).getLocalLanguage();
    String brp_code = getLanguageModules(0);
    TranslateLanguage language = getLanguage(0);
    //looping through languages
    languages.forEach((lang) { x ++; 
      if (lang == default_language) {
        brp_code = getLanguageModules(x);
        language = getLanguage(x);
      }
    }); 
    // return brp code
    return language; 
  }

  // getting the user selected lnaguage choice
  static Future <TranslateLanguage> getTranslateLanguage () async {
    // getting built in translated langauges
    List <String> languages = Languages.getSupportedLanguages(); int x = -1;
    String default_language = await LocalStorage(callback: (val) {}).getTranslateLanguage();
    String brp_code = getLanguageModules(7);
    TranslateLanguage language = getLanguage(0);
    // looping through available languages
    languages.forEach((lang) { x ++;
      if (lang == default_language) {
        brp_code = getLanguageModules(x);
        language = getLanguage(x);
      }
    });
    return language;
  }

  // locally stored languages
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

  static TranslateLanguage getLanguage (index) {
    return [
      TranslateLanguage.english, TranslateLanguage.spanish,
      TranslateLanguage.chinese, TranslateLanguage.japanese,
      TranslateLanguage.german, TranslateLanguage.greek,
      TranslateLanguage.french, TranslateLanguage.hebrew,
      TranslateLanguage.hindi, TranslateLanguage.italian,
      TranslateLanguage.korean, TranslateLanguage.portuguese,
      TranslateLanguage.romanian, TranslateLanguage.russian,
      TranslateLanguage.turkish,
    ][index];
  }
 
  static Future <String> translate (text, context) async { String response = "";
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    });
    
      // translate algorithm
    final TranslateLanguage _sourceLanguage = await getLocalLanguage();
    final TranslateLanguage _targetLanguage = await getTranslateLanguage();
    final _onDeviceTranslator = OnDeviceTranslator(sourceLanguage: _sourceLanguage, targetLanguage: _targetLanguage);
    
    try {

      // downloading language models
      
    // getting the translated text
      response += await _onDeviceTranslator.translateText(text); Navigator.pop(context);
      return response; 

    } catch (e) {Navigator.pop(context);} finally {
      _onDeviceTranslator.close();
    } return response;
  }

  // downloading libraries
  static Future <void> downloadDictionary (BuildContext ctx) async {

    showDialog(
      barrierDismissible: false,
      context: ctx, builder: (context) {
      return AlertDialog(content: CircularProgressIndicator(),);
    });

    final modelManager = OnDeviceTranslatorModelManager();

    // downloading libraries
    if (!await modelManager.isModelDownloaded(await getLocalLanguageBRPCode()))
      final bool response_ = await modelManager.isModelDownloaded(await getLocalLanguageBRPCode());
    if (!await modelManager.isModelDownloaded(await getTranslateLanguageBRPCode()))
      final bool response__ = await modelManager.isModelDownloaded(await getTranslateLanguageBRPCode());

  }
   
}