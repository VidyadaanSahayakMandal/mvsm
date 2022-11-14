/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\cloud.dart
 * Path: c:\dev\wip\vsm\svsm\lib\cloud
 * Created Date: Saturday, November 12th 2022, 10:28:01 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

class Cloud {
  static const apiBaseUrl = "";
  static const clientSecret = "";
  static var userSecret = "";
  static var token = "";

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
