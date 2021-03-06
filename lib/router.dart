import 'package:flutter/material.dart';
import 'package:chatbot/Constants.dart';
import 'package:chatbot/ui/ChatbotSelection.dart';
import 'package:chatbot/ui/ChatScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CONTACTSROUTE:
        return MaterialPageRoute(builder: (_) => ChatbotSelection());
      case CHATROUTE:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ChatScreen(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
