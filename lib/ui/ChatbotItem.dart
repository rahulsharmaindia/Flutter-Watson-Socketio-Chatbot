import 'package:flutter/material.dart';
import 'package:chatbot/Constants.dart';

class ChatbotItem extends StatelessWidget {
  final String iconPath;
  final String target;
  ChatbotItem({this.iconPath, this.target});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CHATROUTE, arguments: target);
      },
      child: new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            cardUI(target),
            thumbnailUI(iconPath),
          ],
        ),
      ),
    );
  }
}

Widget thumbnailUI(String iconPath) => new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(47.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 11.0,
            offset: new Offset(10.0, 0.0),
          ),
        ],
      ),
      width: 94.0,
      height: 94.0,
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.center,
      child: new Image(
        image: new AssetImage(iconPath),
        height: 80.0,
        width: 80.0,
      ),
    );

Widget cardUI(name) => new Container(
      height: 124.0,
      width: 250.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xDD333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
      child: new Container(
        alignment: Alignment(0.3, 0.0),
        child: new Text(
          name,
          style: new TextStyle(
            fontSize: 20.0,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
      ),
    );
