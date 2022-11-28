/*
 * Filename: c:\dev\wip\vsm\svsm\lib\main.dart
 * Path: c:\dev\wip\vsm\svsm\lib
 * Created Date: Friday, November 11th 2022, 4:08:39 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:flutter/material.dart';
import 'pages/goals.dart';
import 'pages/home.dart';
import 'pages/finances.dart';

void main() {
  print("Before runapp");
  runApp(MyApp());
  print("End of main");
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int _currentIndex = 0;
  static const List<Widget> _pages = <Widget>[Home(), Finances(), Goals()];

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primaryColor: Colors.blue,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF7F9FB),
        dividerColor: Colors.grey.withOpacity(0.3),
      ),
      home: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: 'HOME',
              activeIcon: Column(
                children: const <Widget>[
                  Icon(
                    Icons.home_rounded,
                    size: 32,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.currency_rupee_rounded),
              label: 'FINANCE',
              activeIcon: Column(
                children: const <Widget>[
                  Icon(
                    Icons.currency_rupee_rounded,
                    size: 32,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.addchart_rounded),
              label: 'GOALS',
              activeIcon: Column(
                children: const <Widget>[
                  Icon(
                    Icons.addchart_rounded,
                    size: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
