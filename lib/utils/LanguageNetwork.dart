import 'package:flutter/material.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LanguageNetwork {

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
  
}