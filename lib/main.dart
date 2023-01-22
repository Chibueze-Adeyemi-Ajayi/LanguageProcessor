import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';
import 'package:language_processor/utils/LanguageNetwork.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.blue,),
    debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  void initState() {
    // TODO: implement initState
    // downloading default language Dictionary
    LanguageNetwork.downloadDefaultDictionary(context);
    super.initState();
  }

  int page_state = 0;
  void setPageState (int page) {
    setState(() {
      page_state = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Flashscreen(callback: setPageState,),
        IndexScreen(callback: setPageState,)
      ][page_state], // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
