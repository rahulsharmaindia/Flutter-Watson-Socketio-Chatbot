import 'package:flutter/material.dart';
import 'package:chatbot/notifier/MessageNotifier.dart';
import 'package:provider/provider.dart';
import 'package:chatbot/ui/MessageItem.dart';
import 'package:chatbot/model/MessageModel.dart';

class MessageList extends StatelessWidget {
  MessageList({this.target});
  final String target;
  final TextEditingController _textController =
      new TextEditingController(); //new
  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<MessageNotifier>(context);
    return new Column(
      children: <Widget>[
        new Flexible(
          child: ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => MessageItem(
              isRobot: messages.items[index].isRobot,
              text: messages.items[index].text,
              target:target
            ),
            itemCount: messages.items.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(context, messages),
        )
      ],
    );
  }

  Widget _buildTextComposer(context, messages) {
    return new IconTheme(
      //new
      data: new IconThemeData(color: Theme.of(context).primaryColor), //new
      child: new Container(
        //modified
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                //onSubmitted: _handleSubmitted(_textController.text, messages),
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () =>
                      _handleSubmitted(_textController.text, messages)),
            ),
          ],
        ),
      ), //new
    );
  }

  void _handleSubmitted(String text, messages) {
    _textController.clear();
    messages.add(new Message(isRobot: false, text: text));
  }
}
