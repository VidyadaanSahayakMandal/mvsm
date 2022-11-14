/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\event.dart
 * Path: c:\dev\wip\vsm\svsm\lib\data
 * Created Date: Saturday, November 12th 2022, 9:59:02 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'data_item.dart';

class Event extends DataItem {
  Event({
    required super.id,
    required this.title,
    required this.eventTime,
    required this.eventType,
  }) : super(context: "Event");

  final String title;
  final String eventType;
  final DateTime eventTime;

  static Future<Event> fetch(String id) async {
    var json = await DataItem.load(context: "Event", id: id);
    return Event(
      id: id,
      title: json["title"],
      eventType: json["eventType"],
      eventTime: DateTime.fromMillisecondsSinceEpoch(json["eventTime"]),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "eventType": eventType,
        "eventTime": eventTime,
      };
}
