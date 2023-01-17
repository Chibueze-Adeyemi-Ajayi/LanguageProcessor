import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
List <String> languages = <String> [
    "English", "Spanish", "Chinese", "Japanese",
    "German", "Greek", "French", "Hebrew", "Hindi",
    "Italian", "Korean", "Portugese", "Romanian", 
    "Russian", "Turkish"
  ];
class _SettingsPageState extends State<SettingsPage> {
  
  
  String default_lang = "English", default_translate = "Spanish";
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
              onChanged: (String ? selected) {
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
              onChanged: (String ? selected) {
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
