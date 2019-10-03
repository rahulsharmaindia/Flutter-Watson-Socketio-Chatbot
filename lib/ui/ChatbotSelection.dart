import 'package:flutter/material.dart';
import 'package:chatbot/ui/ChatbotItem.dart';
import 'package:chatbot/Constants.dart';

class ChatbotSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('AI ChatBot'),
      ),
      body: new ListView(
        children: <Widget>[
          new ChatbotItem(iconPath: WATSON_ICON_PATH, target: WATSON_ASSISTANT),
          new ChatbotItem(iconPath: GOOLE_DIALOG_ICON_PATH, target: GOOGLE_ASSISTANT),
        ],
      ),
    );
  }
}
