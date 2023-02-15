import 'package:shared_preferences/shared_preferences.dart';

// this module handles 
// localstorage stores the user's s

class LocalStorage {
   LocalStorage({required this.callback});  final callback;
   String key = "nlp", key2 = "nlp_2";
   // Obtain shared preferences.
Future <void> addLocalLanguage (String lang) async {
     try {

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(key, lang.toString());
        callback("$lang set as local language");
    
     } catch (e) {callback("Unexpected error adding input language");print(e);}
   }
   Future <void> addTranslateLanguage (String lang) async {
     try {

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key2, lang.toString());
      callback("$lang set as translate language");
    
     } catch (e) {callback("Unexpected error adding translate language");}
   }
   Future <String> getLocalLanguage () async {
     final prefs = await SharedPreferences.getInstance();
     return await prefs.getString(key).toString();
   }
   Future <String> getTranslateLanguage () async {
     final prefs = await SharedPreferences.getInstance();
     return await prefs.getString(key2).toString();
   }
}