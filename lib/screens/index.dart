import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_processor/fragments/home.dart';
import 'package:language_processor/fragments/settings.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key, required this.callback}) : super(key: key);
  final callback;
  @override
  State<IndexScreen> createState() => _IndexScreenState(callback: callback);
}

class _IndexScreenState extends State<IndexScreen> { 
  final callback;
  AppBar appBar () {
    return AppBar(
      title: Row(children: [Text("Language Processor", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,))],),
      toolbarHeight: 75, 
      backgroundColor: Colors.white, elevation: .25,
      leading: Image.asset("assets/img/icon.png"),
      actions: [
        IconButton(icon: Icon(CupertinoIcons.speaker_1_fill, color: Colors.grey,), onPressed: () {},),
        PopupMenuButton(itemBuilder: (context) {
          return [];
        }, icon: Icon(Icons.more_vert, color: Colors.grey),)
      ],
    );
  }
  BottomNavigationBar getBottomNavBar () {
    return BottomNavigationBar(
      backgroundColor: Colors.white, fixedColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color:Colors.blueAccent), 
          label: "home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color:Colors.grey), 
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
        child: PageView(children: [
          HomePage(),
          SettingsPage()
        ],),),
      bottomNavigationBar: getBottomNavBar(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: .5,
        onPressed: () {}, child: Icon(Icons.mic),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}