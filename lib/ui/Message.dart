import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  Message({this.text, this.animationController, this.mar});
  final String text;
  final AnimationController animationController;
  final String _name = "Rahul";
  final double mar;
  @override
  Widget build(BuildContext context) {

    //double c_width = MediaQuery.of(context).size.width * 0.7;
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, mar, 0.0),
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
