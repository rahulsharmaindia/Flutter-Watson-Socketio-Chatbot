import 'package:flutter/foundation.dart';
import 'package:chatbot/model/MessageModel.dart';
import 'package:chatbot/controller/SocketController.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:chatbot/Constants.dart';

class MessageNotifier with ChangeNotifier {
  final List<Message> _messages = [];
  final String target;
  List<Message> get items => List.of(_messages.reversed);
  MessageNotifier({this.target}) {
    if (target == WATSON_ASSISTANT) {
      print("watson notifier initialized ****************************");
      // Let's initialize the WebSockets communication
      sockets.initCommunication();

      // and ask to be notified as soon as a message comes in
      sockets.addListener(this.addRobotMsg);
    }
    print("notifier initialized ****************************"+this.hashCode.toString());
  }
  void add(Message message) {
    if (target == WATSON_ASSISTANT) {
      sockets.send(message.text);
    } else {
      dialogResponse(message.text);
    }
    _messages.add(message);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addRobotMsg(String message) {
    _messages.add(new Message(isRobot: true, text: message));
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addGMRobotMsg(String message) {
    _messages.add(new Message(isRobot: true, text: message));
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void dialogResponse(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/NewAgent-Google.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    try {
      AIResponse response = await dialogflow.detectIntent(query);
      print("got response*****************************************"+this.hashCode.toString());
      addGMRobotMsg(response.getMessage());
    } catch (e) {
      print("Problem while getting response" + e);
    }
  }
  @override
  void dispose() {
    print("notifier disposed*****************************************"+this.hashCode.toString());
    super.dispose();
    sockets.removeListener(this.addRobotMsg);
  }
}
