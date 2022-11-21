/*
 * Filename: c:\dev\wip\vsm\svsm\lib\widgets\route_button.dart
 * Path: c:\dev\wip\vsm\svsm\lib\widgets
 * Created Date: Saturday, November 12th 2022, 4:45:26 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:svsm/data/cloud.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({
    super.key,
    required this.path,
    required this.image,
    this.arguments = const {},
  });

  final String path;
  final String image;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(33, 147, 207, 0.4),
          width: 2,
        ),
        shape: BoxShape.circle,
        color: const Color.fromRGBO(246, 130, 31, 0.2),
      ),
      child: IconButton(
        icon: Image.asset(
          "assets/$image.png",
        ),
        onPressed: () {
          Cloud.websocketSend(
            action: "WebSocketEcho",
            data: {"message": "Hello World"},
          );
          Navigator.pushNamed(context, path);
        },
      ),
    );
  }
}
