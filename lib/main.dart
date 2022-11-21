/*
 * Filename: c:\dev\wip\vsm\svsm\lib\main.dart
 * Path: c:\dev\wip\vsm\svsm\lib
 * Created Date: Friday, November 11th 2022, 4:08:39 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:flutter/material.dart';
import 'package:svsm/data/cloud.dart';
import 'package:svsm/pages/finance.dart';
import 'package:svsm/pages/goals.dart';
import 'package:svsm/pages/login.dart';
import 'package:svsm/pages/sharing.dart';
import 'package:svsm/pages/updates.dart';

import 'pages/dashboard.dart';

void main() {
  print("Before runapp");
  runApp(const MyApp());
  print("End of main");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("MyApp build");
    Cloud.websocketInit();
    Cloud.webSocketSubscribe();
    return MaterialApp(
      routes: {
        "/": (context) => const Login(),
        "/finance": (context) => const Finance(),
        "/goals": (context) => const Goals(),
        "/sharing": (context) => const Sharing(),
        "/updates": (context) => const Updates(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: const Color(0xff2193cf),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF7F9FB),
        dividerColor: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}
