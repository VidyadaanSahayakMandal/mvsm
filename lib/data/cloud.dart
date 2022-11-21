/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\cloud.dart
 * Path: c:\dev\wip\vsm\svsm\lib\cloud
 * Created Date: Saturday, November 12th 2022, 10:28:01 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class Cloud {
  static const apiBaseUrl = "";
  static const clientSecret = "";
  static var userSecret = "";
  static var token = "";

  static late IOWebSocketChannel channel;
  static bool connected = false;

  static void websocketInit() {
    print("Websocket Init");
    channel = IOWebSocketChannel.connect(
        'wss://gc2ihl2bog.execute-api.ap-south-1.amazonaws.com/v1');
    print("Websocket Connected");
  }

  static webSocketSubscribe() {
    channel.stream.listen((message) {
      print("Websocket Message ${jsonDecode(message)}");
      // channel.sink.add('received!');
      // channel.sink.close(status.goingAway);
    }, onDone: () {
      print("Done ${channel.closeCode} ${channel.closeReason}");
    }, onError: (error) {
      print("Websocket Error: $error");
    });
  }

  static void websocketSend({action, data}) {
    print("Sending $data");
    channel.sink.add(jsonEncode({"action": action, "data": data}));
  }

  static Future<dynamic> post(Map<String, dynamic> payload) async {
    return {};
  }

  static Future<dynamic> get({
    required String context,
    required String id,
  }) async {
    return {};
  }

  static Future<void> put(
      String resource, Map<String, dynamic> payload) async {}
}
