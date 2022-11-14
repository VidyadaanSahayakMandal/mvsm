/*
 * Filename: c:\dev\wip\vsm\svsm\lib\widgets\fund_request.dart
 * Path: c:\dev\wip\vsm\svsm\lib\widgets
 * Created Date: Saturday, November 12th 2022, 11:58:01 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:flutter/material.dart';
import 'package:svsm/widgets/common.dart';

class FundRequestWidget extends StatefulWidget {
  const FundRequestWidget({super.key});

  @override
  State<FundRequestWidget> createState() => _FundRequestWidgetState();
}

class _FundRequestWidgetState extends State<FundRequestWidget> {
  var title = "";
  var description = "";
  var amount = 0;
  var category = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Plan Expenditure", style: Common.textStyleHeader1),
        TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Reason",
          ),
          onChanged: (value) {},
        ),
        TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Details",
          ),
          onChanged: (value) {},
          keyboardType: TextInputType.multiline,
          maxLines: 5,
        ),
      ],
    );
  }
}
