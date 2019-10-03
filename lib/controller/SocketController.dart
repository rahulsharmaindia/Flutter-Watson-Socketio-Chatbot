import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';

///
/// Application-level global variable to access the WebSockets
///
final WebSocketsNotifications sockets = new WebSocketsNotifications();

///
/// Put your WebSockets server IP address and port number
///
const String _SERVER_ADDRESS = "wss://watson-chat-server-demo.herokuapp.com/";

class WebSocketsNotifications {
  //static final WebSocketsNotifications _sockets = new WebSocketsNotifications._internal();

  /* factory WebSocketsNotifications(){
    return _sockets;
  } */

 // WebSocketsNotifications._internal();

  ///
  /// The WebSocket "open" channel
  ///
  IOWebSocketChannel _channel;

  ///
  /// Is the connection established?
  ///
  bool _isOn = false;
  
  ///
  /// Listeners
  /// List of methods to be called when a new message
  /// comes in.
  ///
  ObserverList<Function> _listeners = new ObserverList<Function>();

  /// ----------------------------------------------------------
  /// Initialization the WebSockets connection with the server
  /// ----------------------------------------------------------
  initCommunication() async {
    print("Socket Initialization Started ****************************");
    ///
    /// Just in case, close any previous communication
    ///
    reset();

    ///
    /// Open a new WebSocket communication
    ///
    try {
      _channel = new IOWebSocketChannel.connect(_SERVER_ADDRESS);

      ///
      /// Start listening to new notifications / messages
      ///
      _channel.stream.listen(_onReceptionOfMessageFromServer);
      _isOn = true;
    } catch(e){
      _isOn = true;
      print("Socket Initialization Exception ****************************");
      print(e);
    }
  }

  /// ----------------------------------------------------------
  /// Closes the WebSocket communication
  /// ----------------------------------------------------------
  reset(){
    if (_channel != null){
      if (_channel.sink != null){
        _channel.sink.close();
        _isOn = false;
        print("Socket Reset ****************************");
      }
    }
  }

  /// ---------------------------------------------------------
  /// Sends a message to the server
  /// ---------------------------------------------------------
  send(String message){
    if (_channel != null){
      if (_channel.sink != null && _isOn){
        print("Sending Message ****************************   "+message);
        _channel.sink.add(message);
      }
    }
  }

  /// ---------------------------------------------------------
  /// Adds a callback to be invoked in case of incoming
  /// notification
  /// ---------------------------------------------------------
  addListener(Function callback){
    _listeners.add(callback);
    print("Listener added ****************************");
  }
  removeListener(Function callback){
    _listeners.remove(callback);
    print("Listener Removed ****************************");
  }

  /// ----------------------------------------------------------
  /// Callback which is invoked each time that we are receiving
  /// a message from the server
  /// ----------------------------------------------------------
  _onReceptionOfMessageFromServer(message){
    _isOn = true;
    _listeners.forEach((Function callback){
      callback(message);
    });
  }
}