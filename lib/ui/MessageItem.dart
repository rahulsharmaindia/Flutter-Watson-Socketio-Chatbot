import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  MessageItem({this.text, this.isRobot, this.target});
  final String text;
  final String target;
  final String _name = "You";
  final bool isRobot;
  @override
  Widget build(BuildContext context) {
    //double c_width = MediaQuery.of(context).size.width * 0.7;
    return new Padding(
      padding: EdgeInsets.fromLTRB(
          isRobot ? 50.0 : 0.0, 10.0, isRobot ? 0.0 : 50.0, 0.0),
      child: new Card(
        elevation: 1.0,
        color: new Color(0xFFFFFFFF),
        margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //child: new GestureDetector( //used to add any gesture to any element
        child: new ListTile(
          leading: new CircleAvatar(
              child: isRobot
                  ? (Image.asset(target == "Customer Care"
                      ? "assets/img/watson_purple.png"
                      : "assets/img/google_dialogflow.png"))
                  : new Text("You"),
              backgroundColor: Colors.grey[100]),
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                isRobot
                    ? "Bot"
                    : _name,
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              new Text(
                new DateTime.now().toString().substring(10, 16),
                style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
          subtitle: new Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: new Text(
              text,
              style: new TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
          ),
        ),
      ),
    );
  }
}
