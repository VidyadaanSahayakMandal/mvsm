/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\fund_request.dart
 * Path: c:\dev\wip\vsm\svsm\lib\cloud
 * Created Date: Saturday, November 12th 2022, 10:08:25 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:svsm/data/data_item.dart';

class FundRequest extends DataItem {
  final String title;
  final String description;
  final int amount;
  final String category;
  final String status;
  final DateTime requestDate;
  final DateTime targetDate;
  final DateTime transactionDate;
  final String workLog;

  FundRequest({
    required super.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.status,
    required this.requestDate,
    required this.targetDate,
    required this.transactionDate,
    required this.workLog,
  }) : super(context: "FuncRequest");

  static Future<FundRequest> fetch(id) async {
    var json = await DataItem.load(context: "Event", id: id);
    return FundRequest(
      id: id,
      title: json["title"],
      amount: json["amount"],
      category: json["category"],
      description: json["description"],
      requestDate: DateTime.fromMillisecondsSinceEpoch(json["requestDate"]),
      targetDate: DateTime.fromMillisecondsSinceEpoch(json["targetDate"]),
      transactionDate:
          DateTime.fromMillisecondsSinceEpoch(json["transactionDate"]),
      status: json["status"],
      workLog: json["workLog"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "context": context,
        "id": id,
        "title": title,
        "amount": amount,
        "category": category,
        "description": description,
        "requestDate": requestDate,
        "targetDate": targetDate,
        "transactionDate": transactionDate,
        "status": status,
        "workLog": workLog,
      };
}
