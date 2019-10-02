import 'package:flutter/material.dart';
import 'package:chatbot/ui/MessageList.dart';

import 'package:chatbot/notifier/MessageNotifier.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  ChatScreen(this.name);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(name),
        ),
        body: new ChangeNotifierProvider(
            builder: (context) => MessageNotifier(target:name), child: new MessageList()));
  }
}
