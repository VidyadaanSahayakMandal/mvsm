/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\expense_record.dart
 * Path: c:\dev\wip\vsm\svsm\lib\cloud
 * Created Date: Saturday, November 12th 2022, 10:08:14 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'data_item.dart';

class ExpenseRecord extends DataItem {
  final String title;
  final String description;
  final String amount;
  final String category;
  final String expenseDate;
  final String reportDate;
  final String status;
  final String workLog;

  ExpenseRecord({
    required super.id,
    required this.amount,
    required this.title,
    required this.description,
    required this.category,
    required this.expenseDate,
    required this.reportDate,
    required this.status,
    required this.workLog,
  }) : super(context: "ExpenseRecord");

  @override
  Map<String, dynamic> toJson() => {
        "context": context,
        "id": id,
        "title": title,
        "amount": amount,
        "category": category,
        "description": description,
        "expenseDate": expenseDate,
        "reportDate": reportDate,
        "status": status,
        "workLog": workLog,
      };
}
