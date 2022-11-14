/*
 * Filename: c:\dev\wip\vsm\svsm\lib\pages\dashboard.dart
 * Path: c:\dev\wip\vsm\svsm\lib\pages
 * Created Date: Saturday, November 12th 2022, 6:37:13 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:svsm/widgets/route_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

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
      appBar: AppBar(title: const Text("Vidyadaan Sahayak Mandal")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(30.0),
            child: const Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/logo.png"),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Reminders:",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("15 Nov: 19:00: VSM Event - Job interviews."),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("17 Nov: 19:00: College - Project submission"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("25 Nov: 19:00: VSM Event - How to crach DSA."),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "30 Nov: 08:00: VSM Process - Submit monthly report."),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: GridView.count(
              crossAxisCount: 4,
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
    );
  }
}
