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
import 'package:http/http.dart' as http;

class Cloud {
  static const clientSecret = "";
  static var userSecret = "";
  static var token = "";

  static late IOWebSocketChannel channel;
  static bool connected = false;

  static const webSocketUrl =
      "wss://gc2ihl2bog.execute-api.ap-south-1.amazonaws.com/v1";
  static const restApiBaseUrl =
      "https://1zw2i3e6xi.execute-api.ap-south-1.amazonaws.com/v1";
  static const otpMailId = "info@vsmthane.org";

  static void websocketInit() {
    print("Websocket Init");
    channel = IOWebSocketChannel.connect(webSocketUrl);
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

  static void websocketSend({
    required String action,
    required dynamic data,
  }) {
    print("Sending $data");
    channel.sink.add(jsonEncode({"action": action, "data": data}));
  }

  static Future<dynamic> post({
    required String service,
    required String action,
    required dynamic data,
  }) async {
    var response = await http.post(
      Uri.parse("$restApiBaseUrl/${service.toLowerCase()}"),
      body: jsonEncode({
        "action": action,
        "data": data,
        "pack": "",
      }),
      // headers: {
      //   "authentication": token,
      // },
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> get({
    required String context,
    required String id,
  }) async {
    return {};
  }

  static Future<void> put(
      String resource, Map<String, dynamic> payload) async {}

  static const SERVICE_USER = "User";
  static const ACTION_SEND_OTP = "SEND_OTP";
  static const ACTION_CHECK_OTP = "CHECK_OTP";
}
