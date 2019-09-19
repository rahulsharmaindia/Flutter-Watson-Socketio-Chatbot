import 'package:flutter/material.dart';
import 'package:chatbot/ui/Message.dart';

class MessageList extends StatefulWidget {
  @override
  State createState() => new MessageListState();
}

class MessageListState extends State<MessageList>
    {
  final TextEditingController _textController =
      new TextEditingController(); //new
  final List<Message> _messages = <Message>[];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('AI ChatBot'),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      //new
      data: new IconThemeData(color: Theme.of(context).accentColor), //new
      child: new Container(
        //modified
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ), //new
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    Message message = new Message(
      text: text,
      mar: 50.0,
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    //new
    for (Message message in _messages) //new
      message.animationController.dispose(); //new
    super.dispose(); //new
  }
}
