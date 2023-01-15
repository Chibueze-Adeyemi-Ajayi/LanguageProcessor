import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Flashscreen extends StatefulWidget {
  const Flashscreen({Key? key, required this.callback}) : super(key: key);
  final callback;
  @override
  State<Flashscreen> createState() => _FlashscreenState(callback: callback);
}

class _FlashscreenState extends State<Flashscreen> {  
  final callback; 
  _FlashscreenState({required this.callback});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){callback(1);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png", width: 200, height: 150,),
            Text("Language Processor", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),), Container(height: 30,),
          ]
        )),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}