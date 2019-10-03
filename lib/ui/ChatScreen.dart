import 'package:flutter/material.dart';
import 'package:chatbot/ui/MessageList.dart';

import 'package:chatbot/notifier/MessageNotifier.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final String target;
  ChatScreen(this.target);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //resizeToAvoidBottomPadding: false ,
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(target),
        ),
        body: new ChangeNotifierProvider(
            builder: (context) => MessageNotifier(target: target),
            child: new MessageList(target: target)));
  }
}
