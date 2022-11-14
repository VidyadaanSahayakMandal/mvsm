/*
 * Filename: c:\dev\wip\vsm\svsm\lib\widgets\logo.dart
 * Path: c:\dev\wip\vsm\svsm\lib\widgets
 * Created Date: Saturday, November 12th 2022, 4:15:00 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      fit: BoxFit.contain,
      image: AssetImage("assets/logo.png"),
    );
  }
}
