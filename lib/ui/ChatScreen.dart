import 'package:flutter/material.dart';
import 'package:chatbot/ui/MessageList.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  ChatScreen(this.name);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: name,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MessageList());
  }
}
