import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'square_button.g.dart';

@swidget
Widget squareButton(
  BuildContext context, {
  Color color = Colors.lightBlue,
  required IconData icon,
  double size = 55,
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Material(
      color: color,
      elevation: 8,
      shadowColor: color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Icon(
              icon,
              color: Colors.black,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    ),
  );
}
