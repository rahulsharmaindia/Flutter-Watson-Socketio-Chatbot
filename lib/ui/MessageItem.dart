import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  MessageItem({this.text, this.isRobot});
  final String text;
  final String _name = "Rahul";
  final bool isRobot;
  @override
  Widget build(BuildContext context) {
    //double c_width = MediaQuery.of(context).size.width * 0.7;
    return new Padding(
        padding: EdgeInsets.fromLTRB(isRobot?50.0:0.0, 10.0, isRobot?0.0:50.0, 0.0),
        child: new Card(
          elevation: 1.0,
          color: const Color(0xFFFFFFFF),
          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          //child: new GestureDetector( //used to add any gesture to any element
          child: new ListTile(
            leading: new CircleAvatar(child: new Text(_name[0])),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  _name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  "12:30 am",
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
