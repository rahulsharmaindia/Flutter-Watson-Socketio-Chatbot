import 'package:flutter/material.dart';
import 'package:chatbot/ui/ContactItem.dart';
import 'package:chatbot/model/Contact.dart';

class ContactList extends StatefulWidget {
  @override
  State createState() => new ContactListState();
}

class ContactListState extends State<ContactList> {
  AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('AI ChatBot'),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return new ContactItem(
                    name: contactMockData[index].name,
                    imageurl: contactMockData[index].profileImageUrl);
              },
              itemCount: contactMockData.length,
            ),
          ),
        ],
      ),
    );
  }
}
