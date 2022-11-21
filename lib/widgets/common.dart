/*
 * Filename: c:\dev\wip\vsm\svsm\lib\widgets\common.dart
 * Path: c:\dev\wip\vsm\svsm\lib\widgets
 * Created Date: Monday, November 14th 2022, 8:34:52 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:flutter/material.dart';

class Common {
  static const textStyleHeader1 = TextStyle(fontSize: 24);
  static const textStyleHeader2 = TextStyle(fontSize: 20);
  static const textStyleParagraph = TextStyle(fontSize: 15);

  static var buttonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  );

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(88, 40),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
}
