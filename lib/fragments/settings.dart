import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';
import 'package:language_processor/utils/LanguageNetwork.dart';
import 'package:language_processor/utils/Languages.dart';
import 'package:language_processor/utils/LocalStorage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
List <String> languages = Languages.getSupportedLanguages();
class _SettingsPageState extends State<SettingsPage> {
  
  String default_lang = "English", default_translate = "Spanish";

  void update_lang_selected () async {
    String _default_lang = await LocalStorage(callback: (value) { print(value); }).getLocalLanguage();
    String _translate_lang = await LocalStorage(callback: (value) { print(value); }).getTranslateLanguage();
    if (_default_lang != "null") setState(() { default_lang = _default_lang.toString(); });
    if (_translate_lang != "null") setState(() { default_translate = _translate_lang.toString(); });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update_lang_selected();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Select input language", style: TextStyle(fontSize: 20), textAlign: TextAlign.start,),
            Container(height: 25,),
            DropdownButton(
              value: default_lang,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: languages.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(), 
              onChanged: (String ? selected) async {
                // downloading the dictionary
                await LanguageNetwork.downloadDictionary(context);
                await LocalStorage(callback: (str) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(str)));
                }).addLocalLanguage(selected.toString());
                setState(() {
                  default_lang = selected.toString();
                });
            }),
            Container(height: 25,),
            Text("Select output language", style: TextStyle(fontSize: 20)),
            Container(height: 25,),
            DropdownButton(
              value: default_translate,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: languages.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(), 
              onChanged: (String ? selected) async {
                // downloading the dictionary
                await LanguageNetwork.downloadDictionary(context);
                await LocalStorage(callback: (str) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(str)));
                }).addTranslateLanguage(selected.toString());
                setState(() {
                  default_translate = selected.toString();
                });
            }),
            
          ],)
        ],)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
