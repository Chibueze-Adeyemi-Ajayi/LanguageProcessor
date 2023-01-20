import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_processor/fragments/home.dart';
import 'package:language_processor/fragments/settings.dart';
import 'package:language_processor/utils/TextToSpeech.dart';
import 'package:language_processor/utils/speech.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key, required this.callback}) : super(key: key);
  final callback;
  @override
  State<IndexScreen> createState() => _IndexScreenState(callback: callback);
}

var pager_controller = PageController();

class _IndexScreenState extends State<IndexScreen> { 
  final callback; bool listening = false;
  Color home_color = Colors.blueAccent,
      settings_color = Colors.grey;

  Speech speech = Speech(callback: (value) {print(value);});
  void _init_speech () async {
      await speech.initSpeech();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {  _init_speech(); } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  
  }
  AppBar appBar () {
    return AppBar(
      title: Row(children: [Text("Language Processor", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,))],),
      toolbarHeight: 75, 
      backgroundColor: Colors.white, elevation: .25,
      leading: Image.asset("assets/img/icon.png"),
      actions: [
        IconButton(icon: Icon(CupertinoIcons.speaker_1_fill, color: Colors.grey,), onPressed: () async {
          await TextToSpeech(callback: () {
            print("spoken");
          }).speak("Jilo Billionaire");
        },),
        PopupMenuButton(itemBuilder: (context) {
          return [];
        }, icon: Icon(Icons.more_vert, color: Colors.grey),)
      ],
    );
  }
  BottomNavigationBar getBottomNavBar () {
    return BottomNavigationBar(
      onTap: (index) {
        if (index == 1)
         pager_controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
        else 
         pager_controller.previousPage(duration: Duration(microseconds: 500), curve: Curves.ease);
      },
      backgroundColor: Colors.white, fixedColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: home_color), 
          label: "home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color:settings_color), 
          label: "Settings"
        ),
      ],
    );
  }
  _IndexScreenState({required this.callback}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(color: Colors.white, 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              home_color = index == 0 ? Colors.blueAccent : Colors.grey;
              settings_color = index == 1 ? Colors.blueAccent : Colors.grey;
            });
          },
          controller: pager_controller,
          children: [
            HomePage(),
            SettingsPage()
          ],),),
      bottomNavigationBar: getBottomNavBar(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: .75, 
        onPressed: () {
          try {

            if (!listening) speech.startListening(); else speech.stopListening();
            
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          }
        }, child: Icon(Icons.mic),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}