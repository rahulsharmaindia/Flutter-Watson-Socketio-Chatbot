import 'package:flutter/material.dart';
import 'package:chatbot/Constants.dart';
import 'package:chatbot/ui/ContactScreen.dart';
import 'package:chatbot/ui/ChatScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case contactsRoute:
        return MaterialPageRoute(builder: (_) => ContactScreen());
      case chatRoute:
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
