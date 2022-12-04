import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'vsm_logo_stack.g.dart';

@swidget
Widget vSMLogoStack(BuildContext context, {required Widget child}) {
  return Stack(
    children: [
      const Positioned(
        bottom: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Opacity(
            opacity: 0.4,
            child: Image(
              height: 50,
              fit: BoxFit.contain,
              image: AssetImage("assets/logo.png"),
            ),
          ),
        ),
      ),
      child
    ],
  );
}
