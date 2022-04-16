import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyApp(),
     ),
    );
  }
}

class MyApp extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = TextEditingController();

    Future _speak(String text) async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-Us");
      await flutterTts.setPitch(1);
      print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: textEditingController,
      ),
      RaisedButton(
        child: Text("START"),
        onPressed: () => _speak(textEditingController.text) ,
      )
      ],
      ),
    );
  }
}

