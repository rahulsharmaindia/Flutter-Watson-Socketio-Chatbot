import 'package:flutter/material.dart';
import 'package:chatbot/Constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactItem extends StatelessWidget {
  ContactItem({this.name, this.imageurl, this.animationController});
  final String name;
  final String imageurl;
  final AnimationController animationController;
  final String _name = "Rahul";

  @override
  Widget build(BuildContext context) {
    //double c_width = MediaQuery.of(context).size.width * 0.7;
    return new InkWell(//for ripple effect on widget see https://flutter.dev/docs/cookbook/gestures/ripples
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: new Card(
          elevation: 1.0,
          color: const Color(0xFFFFFFFF),
          margin: const EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
          //child: new GestureDetector( //used to add any gesture to any element
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new CachedNetworkImageProvider(imageurl),
              backgroundColor: Colors.grey,
            ),
            title: new Text(
              name,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("clicked"))),
            onTap: () =>
                Navigator.pushNamed(context, chatRoute, arguments: name),
          ),
        ),
      ),
    );
  }
}
