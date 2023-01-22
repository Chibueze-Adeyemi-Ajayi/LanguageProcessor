import 'package:flutter/material.dart';
import 'package:language_processor/screens/flashscreen.dart';
import 'package:language_processor/screens/index.dart';
import 'package:language_processor/utils/LanguageNetwork.dart';
import 'package:language_processor/utils/speech.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> { String lang = "null", translate = "null";
  
static final TextEditingController inputTextController = new TextEditingController(), outputTextController = new TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: Column(children: [
          Container(height: 8,),
          //Text("JILO Language Translator", style: TextStyle(fontSize: 25),),
          Container(height: 25,),
          Container(child: TextField( 
              controller: inputTextController,
              maxLines: null, minLines: 1,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                hintText: "Type or paste word to translate", 
                label: Text("Text to Translate"),
                border: InputBorder.none
              ),
            ),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent)
            ),
            width: MediaQuery.of(context).size.width, height: 200,),
          Container(height: 25,),
          // Text("Detected langauge: $lang"),
          // Container(height: 15,),
          // Text("Translating to: $translate"),
          Container(height: 25,),
          Container(child: TextField( 
              enabled: false,
              controller: outputTextController,
              maxLines: null, minLines: 1,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                hintText: "Translated Word", 
                label: Text("Translated Word"),
                border: InputBorder.none
              ),
            ),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent)
            ),
            width: MediaQuery.of(context).size.width, height: 200,),
          Container(height: 25,),
          TextButton(onPressed: () async {
            var text = inputTextController.text;
            //displaying toast message
            if (text == "") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Input")));
              return;
            }
          }, child: GestureDetector(child: Container(
            height: 55, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Translate", style: TextStyle(color: Colors.white, fontSize: 18),), Container(width: 15,), Icon(Icons.translate, color: Colors.white,)
          ],),), onTap: () async {
            //String language = await LanguageNetwork.detectLanguage(inputTextController.text, context);
            String response = await LanguageNetwork.translate(inputTextController.text, context);
            String translating_lang = await LanguageNetwork.getTranslateLanguageBRPCode();
            // String response = await LanguageNetwork.getTranslateLanguageBRPCode(); 
            setState(() {
              outputTextController.text = response;
              // lang = language; 
              translate = translating_lang;
            });
          },)
          ),
          Container(height: 25,)
        ],)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
