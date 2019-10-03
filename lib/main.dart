import 'package:flutter/material.dart';
import 'package:chatbot/ui/ChatbotSelection.dart';
import 'package:chatbot/router.dart';
import 'package:chatbot/Constants.dart';

void main() => runApp(new MaterialApp(
    onGenerateRoute: Router.generateRoute,
    initialRoute: CONTACTSROUTE,
    title: 'AI ChatBot',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: new Color(0xFF333366),
      accentColor: Colors.cyan[600],
      // Define the default font family.
      fontFamily: 'Roboto',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    home: ChatbotSelection()));
