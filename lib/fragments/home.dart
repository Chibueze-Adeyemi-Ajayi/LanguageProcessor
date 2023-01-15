import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( padding: EdgeInsets.all(10),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: Column(children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Type message to translate",
              helperText: "Translate Text"
            ),
          )
        ],)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
