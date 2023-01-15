import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: Column(children: [
          
        ],)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
