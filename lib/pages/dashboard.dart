/*
 * Filename: c:\dev\wip\vsm\svsm\lib\pages\dashboard.dart
 * Path: c:\dev\wip\vsm\svsm\lib\pages
 * Created Date: Saturday, November 12th 2022, 6:37:13 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:svsm/data/cloud.dart';
import 'package:svsm/widgets/route_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  final String title = "VSM";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                  child: const Image(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Reminders:",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: const [
                  Card(
                    elevation: 4,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text("VSM Event - Job interviews"),
                      subtitle: Text("15 Nov: 19:00"),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text("College - Project submission"),
                      subtitle: Text("17 Nov: 19:00"),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text("VSM Event - How to crack DSA"),
                      subtitle: Text("25 Nov: 19:00"),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text("VSM Process - Submit Monthly Report"),
                      subtitle: Text("25 Nov: 19:00"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(30),
                children: const [
                  RouteButton(path: "/goals", image: "goals"),
                  RouteButton(path: "/finance", image: "finance"),
                  RouteButton(path: "/sharing", image: "sharing"),
                  RouteButton(path: "/updates", image: "updates"),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
