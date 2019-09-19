import 'package:flutter/material.dart';
import 'package:chatbot/ui/ContactList.dart';
import 'package:chatbot/router.dart';
import 'package:chatbot/Constants.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        onGenerateRoute: Router.generateRoute,
        initialRoute: contactsRoute,
        title: 'AI ChatBot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new ContactList());
  }
}
