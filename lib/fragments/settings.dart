import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  var languages = [
    "English", "Spanish", "Chinese", "Japanese"
  ];

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
            Text("Select input language", textAlign: TextAlign.start,),
            Container(height: 25,),
            DropdownButton(
              value: "English",
              icon: const Icon(Icons.keyboard_arrow_down),
              items: languages.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(), 
              onChanged: (index) {

            }),
            Container(height: 25,),
            Text("Select output language"),
          ],)
        ],)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
