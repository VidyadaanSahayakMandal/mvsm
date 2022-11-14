/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\data_item.dart
 * Path: c:\dev\wip\vsm\svsm\lib\cloud
 * Created Date: Saturday, November 12th 2022, 10:21:10 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'cloud.dart';

abstract class DataItem {
  String context;
  String id;

  DataItem({required this.context, required this.id});

  static Future<dynamic> load({
    required String context,
    required String id,
  }) async {
    await Cloud.get(context: context, id: id);
    return {};
  }

  Future<void> save() async {
    await Cloud.put("data", toJson());
  }

  Map<String, dynamic> toJson();
}
