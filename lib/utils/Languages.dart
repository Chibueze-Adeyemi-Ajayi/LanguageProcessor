import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class Languages {

  static List <String> getSupportedLanguages () {
    return <String> [
      "English", "Spanish", "Chinese", "Japanese",
      "German", "Greek", "French", "Hebrew", "Hindi",
      "Italian", "Korean", "Portugese", "Romanian", 
      "Russian", "Turkish"
    ];
  }
}