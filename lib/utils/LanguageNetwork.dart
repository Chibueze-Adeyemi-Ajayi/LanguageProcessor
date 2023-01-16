import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LanguageNetwork {

  static final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);

  static Future <List> detectLanguage (String text) async {
    final String response = await languageIdentifier.identifyLanguage(text);
    print(response);
    final List<IdentifiedLanguage> possibleLanguages = await languageIdentifier.identifyPossibleLanguages(text);
    return possibleLanguages;
  }
  
}